import 'package:flutter/material.dart';

import '../../domain/models/driver.dart';
import '../widgets/driver_card.dart';
import '../widgets/ride_bottom_panel.dart';
import '../widgets/ride_header.dart';

class TripInProgressPanel extends StatelessWidget {
  final Driver driver;

  const TripInProgressPanel({
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
            icon: Icons.route,
            color: Colors.orange,
            title: 'On the way',
            subtitle: 'Relax while we take you to your destination.',
          ),

          const SizedBox(height: 24),

          DriverCard(driver: driver),

          const SizedBox(height: 24),

          const LinearProgressIndicator(),

          const SizedBox(height: 12),

          const Text(
            'Almost there...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}