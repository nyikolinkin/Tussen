import 'package:flutter/material.dart';

import '../../domain/models/driver_card.dart';
import '../widgets/driver_card.dart';
import '../widgets/ride_bottom_panel.dart';

class WaitingPanel extends StatelessWidget {
  final Driver driver;

  const WaitingPanel({
    super.key,
    required this.driver,
  });

  @override
  Widget build(BuildContext context) {
    return RideBottomPanel(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),

          const SizedBox(height: 24),

          Text(
            'Waiting for ${driver.name}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Your ride request has been sent.',
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          DriverCard(driver: driver),
        ],
      ),
    );
  }
}