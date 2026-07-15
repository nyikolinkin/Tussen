import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_text_styles.dart';
import '../../../rides/data/mocks/mock_driver.dart';
import '../widgets/driver_card.dart';

class DriverFoundScreen extends StatelessWidget {
  const DriverFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              const Icon(
                Icons.check_circle,
                size: 80,
                color: Colors.green,
              ),

              const SizedBox(height: 24),

              Text(
                'Driver Found!',
                style: AppTextStyles.heading1,
              ),

              const SizedBox(height: 12),

              Text(
                'We have matched you with the nearest available driver.',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              const DriverCard(
                driver: mockDriver,
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}