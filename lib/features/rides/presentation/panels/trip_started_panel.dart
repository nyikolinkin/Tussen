import 'package:flutter/material.dart';

import '../../domain/models/driver.dart';
import '../widgets/driver_card.dart';
import '../widgets/ride_bottom_panel.dart';
import '../widgets/ride_header.dart';

class TripStartedPanel extends StatelessWidget {
  final Driver driver;

  const TripStartedPanel({
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
            icon: Icons.directions_car,
            color: Colors.green,
            title: 'Trip Started',
            subtitle: 'Enjoy your journey. We hope you have a safe trip!',
          ),

          const SizedBox(height: 24),

          DriverCard(driver: driver),

          const SizedBox(height: 24),

          const LinearProgressIndicator(),

          const SizedBox(height: 12),

          const Text(
            'Driving to your destination...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}