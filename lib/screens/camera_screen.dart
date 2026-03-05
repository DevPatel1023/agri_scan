import 'package:flutter/material.dart';
import 'package:agri_scan/screens/ai_scanning_screen.dart';
import 'package:agri_scan/components/agri_bottom_nav.dart';

class CameraScreen extends StatelessWidget {
  static const String routeName = '/camera';

  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF2E7D32);
    const lightGreen = Color(0xFFE8F5E9);
    const textPrimary = Color(0xFF1B3A1D);
    const textSecondary = Color(0xFF5B6E5D);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 420,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: primaryGreen.withValues(alpha: 0.12),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: lightGreen,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFC7DEC8)),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.document_scanner_rounded,
                          size: 74, color: primaryGreen),
                      SizedBox(height: 14),
                      Text(
                        'Camera Preview',
                        style: TextStyle(
                          color: textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Align a leaf in the frame for best results',
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, AiScanningScreen.routeName);
                  },
                  icon: const Icon(Icons.flash_on_rounded),
                  label: const Text(
                    'Start AI Scan',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AgriBottomNav(currentIndex: 1),
    );
  }
}
