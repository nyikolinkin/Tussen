import 'package:flutter/material.dart';

import '../../../rides/domain/models/driver_card.dart';
import 'driver_avatar.dart';

class DriverCard extends StatelessWidget {
  final Driver driver;

  const DriverCard({
    super.key,
    required this.driver,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const DriverAvatar(),

            const SizedBox(height: 16),

            Text(
              driver.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 8),

            Text(
              '${driver.rating} ★',
            ),

            const SizedBox(height: 16),

            Text(driver.vehicle),

            Text(driver.vehicleColor),

            Text(driver.registrationNumber),

            const SizedBox(height: 12),

            Text(
              'ETA: ${driver.etaMinutes} minutes',
            ),
          ],
        ),
      ),
    );
  }
}