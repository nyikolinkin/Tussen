import 'package:flutter/material.dart';

import '../../domain/models/driver.dart';
import '../widgets/driver_card.dart';
import '../widgets/ride_bottom_panel.dart';
import '../widgets/ride_header.dart';

class DriverArrivedPanel extends StatelessWidget {
  final Driver driver;

  const DriverArrivedPanel({
    super.key,
    required this.driver,
  });

  @override
  Widget build(BuildContext context) {
    return RideBottomPanel(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const RideHeader(
            icon: Icons.location_on,
            color: Colors.green,
            title: 'Your driver has arrived',
            subtitle: 'Please make your way to the pickup location.',
          ),

          const SizedBox(height: 24),

          DriverCard(driver: driver),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                // We'll connect this later
              },
              icon: const Icon(Icons.directions_car),
              label: const Text('I\'m in the car'),
            ),
          ),
        ],
      ),
    );
  }
}