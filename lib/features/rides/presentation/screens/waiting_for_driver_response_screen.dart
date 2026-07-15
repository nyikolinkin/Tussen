import 'package:flutter/material.dart';

import '../../../../app/theme/app_text_styles.dart';
import '../../domain/models/driver_card.dart';
import '../widgets/driver_card.dart';

class WaitingForDriverResponseScreen extends StatelessWidget {
  final Driver driver;

  const WaitingForDriverResponseScreen({
    super.key,
    required this.driver,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),

            const CircularProgressIndicator(),

            const SizedBox(height: 30),

            Text(
              'Waiting for ${driver.name}',
              style: AppTextStyles.heading1,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Text(
              'Your ride request has been sent.',
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            DriverCard(driver: driver),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}