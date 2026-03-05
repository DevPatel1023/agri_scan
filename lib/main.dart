import 'package:agri_scan/screens/home_screen.dart';
import 'package:agri_scan/screens/camera_screen.dart';
import 'package:agri_scan/screens/ai_scanning_screen.dart';
import 'package:agri_scan/screens/disease_result_screen.dart';
import 'package:agri_scan/screens/history_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AgriScanApp());
}

class AgriScanApp extends StatelessWidget {
  const AgriScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriScan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D32)),
        scaffoldBackgroundColor: const Color(0xFFF4FAF4),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        CameraScreen.routeName: (context) => const CameraScreen(),
        AiScanningScreen.routeName: (context) => const AiScanningScreen(),
        DiseaseResultScreen.routeName: (context) => const DiseaseResultScreen(),
        HistoryScreen.routeName: (context) => const HistoryScreen(),
      },
    );
  }
}
