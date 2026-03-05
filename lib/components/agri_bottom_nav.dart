import 'package:agri_scan/screens/ai_scanning_screen.dart';
import 'package:agri_scan/screens/camera_screen.dart';
import 'package:agri_scan/screens/disease_result_screen.dart';
import 'package:agri_scan/screens/history_screen.dart';
import 'package:agri_scan/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AgriBottomNav extends StatelessWidget {
  const AgriBottomNav({super.key, required this.currentIndex});

  final int currentIndex;

  static const List<String> _routes = [
    HomeScreen.routeName,
    CameraScreen.routeName,
    AiScanningScreen.routeName,
    DiseaseResultScreen.routeName,
    HistoryScreen.routeName,
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      backgroundColor: Colors.white,
      indicatorColor: const Color(0xFFE8F5E9),
      onDestinationSelected: (index) {
        if (index == currentIndex) return;
        Navigator.pushReplacementNamed(context, _routes[index]);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.photo_camera_outlined),
          selectedIcon: Icon(Icons.photo_camera_rounded),
          label: 'Camera',
        ),
        NavigationDestination(
          icon: Icon(Icons.auto_awesome_outlined),
          selectedIcon: Icon(Icons.auto_awesome_rounded),
          label: 'Scan',
        ),
        NavigationDestination(
          icon: Icon(Icons.analytics_outlined),
          selectedIcon: Icon(Icons.analytics_rounded),
          label: 'Result',
        ),
        NavigationDestination(
          icon: Icon(Icons.history_outlined),
          selectedIcon: Icon(Icons.history_rounded),
          label: 'History',
        ),
      ],
    );
  }
}
