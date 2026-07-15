import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_text_styles.dart';
import '../../data/mocks/mock_drivers.dart';
import '../widgets/available_driver_card.dart';
import '../../../../../app/router/app_routes.dart';

class AvailableDriversScreen extends StatelessWidget {
  const AvailableDriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Drivers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Your Driver',
              style: AppTextStyles.heading1,
            ),

            const SizedBox(height: 8),

            Text(
              'We found ${mockDrivers.length} nearby drivers.',
              style: AppTextStyles.body,
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.separated(
                itemCount: mockDrivers.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final driver = mockDrivers[index];

                  return AvailableDriverCard(
                    driver: driver,
                    onRequestRide: () {
                      context.push(
                        AppRoutes.waitingForDriverResponse,
                        extra: driver,
                        );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}