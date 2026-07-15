import 'package:flutter/material.dart';

import '../../../../app/theme/app_text_styles.dart';
import '../../domain/models/driver_card.dart';

class AvailableDriverCard extends StatelessWidget {
  final Driver driver;
  final VoidCallback? onRequestRide;

  const AvailableDriverCard({
    super.key,
    required this.driver,
    this.onRequestRide,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Driver Name + Rating
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  child: Text(
                    driver.name.substring(0, 1),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    driver.name,
                    style: AppTextStyles.heading2,
                  ),
                ),

                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),

                const SizedBox(width: 4),

                Text(driver.rating.toString()),
              ],
            ),

            const SizedBox(height: 20),

            _infoRow(Icons.directions_car, driver.vehicle),

            const SizedBox(height: 12),

            _infoRow(Icons.palette_outlined, driver.vehicleColor),

            const SizedBox(height: 12),

            _infoRow(Icons.badge_outlined, driver.registrationNumber),

            const SizedBox(height: 12),

            _infoRow(
              Icons.access_time,
              '${driver.etaMinutes} min away',
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 12,
                ),

                const SizedBox(width: 8),

                Text(
                  'Available',
                  style: AppTextStyles.body,
                ),
              ],
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onRequestRide,
                child: const Text('Request Ride'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _infoRow(
    IconData icon,
    String text,
  ) {
    return Row(
      children: [
        Icon(icon, size: 18),

        const SizedBox(width: 10),

        Text(text),
      ],
    );
  }
}