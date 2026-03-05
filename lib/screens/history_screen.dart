import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = '/history';

  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF2E7D32);
    const lightGreen = Color(0xFFE8F5E9);
    const textPrimary = Color(0xFF1B3A1D);
    const textSecondary = Color(0xFF5B6E5D);

    final historyItems = [
      {
        'crop': 'Tomato',
        'disease': 'Early Blight',
        'date': '05 Mar 2026',
        'confidence': '92%'
      },
      {
        'crop': 'Chili',
        'disease': 'Leaf Curl Virus',
        'date': '03 Mar 2026',
        'confidence': '88%'
      },
      {
        'crop': 'Potato',
        'disease': 'Late Blight',
        'date': '27 Feb 2026',
        'confidence': '90%'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan History'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: historyItems.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = historyItems[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: primaryGreen.withValues(alpha: 0.08),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: const BoxDecoration(
                      color: lightGreen,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.eco_rounded, color: primaryGreen),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['crop']!,
                          style: const TextStyle(
                            color: textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['disease']!,
                          style: const TextStyle(
                            color: textSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['date']!,
                          style: const TextStyle(
                            color: textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: lightGreen,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      item['confidence']!,
                      style: const TextStyle(
                        color: primaryGreen,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
