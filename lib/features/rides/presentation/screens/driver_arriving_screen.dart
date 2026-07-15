import 'package:flutter/material.dart';

import '../../../../app/theme/app_text_styles.dart';
import '../../data/mocks/mock_driver.dart';
import '../widgets/driver_card.dart';
import '../widgets/map_placeholder.dart';

class DriverArrivingScreen extends StatelessWidget {
  const DriverArrivingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver is on the way'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Your driver is arriving',
                style: AppTextStyles.heading1,
              ),

              const SizedBox(height: 8),

              Text(
                'Estimated arrival: 3 minutes',
                style: AppTextStyles.body,
              ),

              const SizedBox(height: 24),

              const MapPlaceholder(),

              const SizedBox(height: 24),

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