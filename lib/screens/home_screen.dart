import 'package:flutter/material.dart';
import 'package:agri_scan/screens/camera_screen.dart';
import 'package:agri_scan/components/agri_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF4FAF4);
    const primaryGreen = Color(0xFF2E7D32);
    const lightGreen = Color(0xFFE8F5E9);
    const textPrimary = Color(0xFF1B3A1D);
    const textSecondary = Color(0xFF5B6E5D);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 54,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14, top: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.eco_rounded,
                  color: primaryGreen,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          'AgriScan',
          style: TextStyle(
            color: textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 22),
              Center(
                child: Container(
                  width: 210,
                  height: 210,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: primaryGreen.withValues(alpha: 0.12),
                        blurRadius: 26,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(22),
                    decoration: const BoxDecoration(
                      color: lightGreen,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.local_florist_rounded,
                      size: 92,
                      color: primaryGreen,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 34),
              const Text(
                'Detect Plant Diseases Instantly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Capture a leaf image and let AgriScan analyze it with AI to provide fast disease diagnosis and treatment suggestions.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 38),
              SizedBox(
                height: 58,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, CameraScreen.routeName);
                  },
                  icon: const Icon(Icons.camera_alt_rounded, size: 22),
                  label: const Text(
                    'Capture Image',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CameraScreen.routeName);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryGreen,
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFFC7DEC8), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Upload from Gallery',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AgriBottomNav(currentIndex: 0),
    );
  }
}
