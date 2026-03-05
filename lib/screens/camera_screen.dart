import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:agri_scan/screens/ai_scanning_screen.dart';

class CameraScreen extends StatefulWidget {
  static const String routeName = '/camera';

  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  int _currentCameraIndex = 0;
  bool _isInitializing = true;
  bool _isCapturing = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  Future<void> _setupCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        setState(() {
          _errorMessage = 'No camera found on this device.';
          _isInitializing = false;
        });
        return;
      }
      await _initializeController(_currentCameraIndex);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Unable to access camera. Please check permissions.';
        _isInitializing = false;
      });
    }
  }

  Future<void> _initializeController(int index) async {
    final previousController = _controller;
    final controller = CameraController(
      _cameras[index],
      ResolutionPreset.high,
      enableAudio: false,
    );

    setState(() {
      _isInitializing = true;
      _errorMessage = null;
    });

    try {
      await controller.initialize();
      await previousController?.dispose();
      if (!mounted) return;
      setState(() {
        _controller = controller;
        _isInitializing = false;
      });
    } catch (_) {
      await controller.dispose();
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Camera failed to start. Try reopening this screen.';
        _isInitializing = false;
      });
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras.length < 2 || _isInitializing) return;
    _currentCameraIndex = (_currentCameraIndex + 1) % _cameras.length;
    await _initializeController(_currentCameraIndex);
  }

  Future<void> _takePictureAndScan() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized || _isCapturing) {
      return;
    }

    setState(() {
      _isCapturing = true;
    });

    try {
      await controller.takePicture();
      if (!mounted) return;
      Navigator.pushNamed(context, AiScanningScreen.routeName);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Capture failed. Please try again.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isCapturing = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (_errorMessage != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    _errorMessage!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            else if (_isInitializing ||
                controller == null ||
                !controller.value.isInitialized)
              const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            if (_errorMessage == null &&
                !_isInitializing &&
                controller != null &&
                controller.value.isInitialized)
              CameraPreview(controller),
            Positioned(
              top: 8,
              left: 10,
              right: 10,
              child: Row(
                children: [
                  _topAction(
                    icon: Icons.close_rounded,
                    onTap: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  _topAction(
                    icon: Icons.cameraswitch_rounded,
                    onTap: _switchCamera,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 24,
              right: 24,
              child: Column(
                children: [
                  const Text(
                    'Align leaf in frame and tap shutter',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _isInitializing || _errorMessage != null
                            ? null
                            : _takePictureAndScan,
                        child: Container(
                          width: 86,
                          height: 86,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _isCapturing
                                    ? Colors.grey.shade500
                                    : Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: _isCapturing
                                  ? const Padding(
                                      padding: EdgeInsets.all(18),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.black,
                                            ),
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topAction({required IconData icon, required VoidCallback onTap}) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
      ),
    );
  }
}
