import 'package:flutter/material.dart';
import 'package:agri_scan/screens/disease_result_screen.dart';
import 'package:agri_scan/components/agri_bottom_nav.dart';

class AiScanningScreen extends StatelessWidget {
  static const String routeName = '/scanning';

  const AiScanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF2E7D32);
    const textPrimary = Color(0xFF1B3A1D);
    const textSecondary = Color(0xFF5B6E5D);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Scanning'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.auto_awesome_rounded,
                  color: primaryGreen, size: 84),
              const SizedBox(height: 24),
              const Text(
                'Analyzing Leaf Image',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Our AI is identifying disease patterns and preparing treatment suggestions.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const LinearProgressIndicator(
                  minHeight: 12,
                  value: 0.78,
                  backgroundColor: Color(0xFFDDEEDC),
                  valueColor: AlwaysStoppedAnimation(primaryGreen),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DiseaseResultScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'View Disease Result',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AgriBottomNav(currentIndex: 2),
    );
  }
}
