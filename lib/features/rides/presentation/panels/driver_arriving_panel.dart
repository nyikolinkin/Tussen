import 'package:flutter/material.dart';

import '../../domain/models/driver.dart';
import '../widgets/driver_card.dart';
import '../widgets/ride_bottom_panel.dart';
import '../widgets/ride_header.dart';

class DriverArrivingPanel extends StatelessWidget {
  final Driver driver;

  const DriverArrivingPanel({
    super.key,
    required this.driver,
  });

  @override
  Widget build(BuildContext context) {
    return RideBottomPanel(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RideHeader(
            icon: Icons.navigation,
            color: Colors.blue,
            title: 'Your driver is on the way',
            subtitle:
                '${driver.name} is driving to your pickup location.',
          ),

          const SizedBox(height: 24),

          DriverCard(driver: driver),

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  label: const Text('Call'),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  label: const Text('Message'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}