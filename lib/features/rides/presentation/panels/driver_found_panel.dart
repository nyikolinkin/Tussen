import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/driver_card.dart';
import '../../domain/models/ride_stage.dart';
import '../../providers/ride_state_provider.dart';
import '../widgets/driver_card.dart';
import '../widgets/ride_bottom_panel.dart';

class DriverFoundPanel extends ConsumerWidget {
  final Driver driver;

  const DriverFoundPanel({
    super.key,
    required this.driver,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RideBottomPanel(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_taxi,
            size: 48,
            color: Colors.green,
          ),

          const SizedBox(height: 16),

          const Text(
            'Driver Found!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          DriverCard(driver: driver),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ref
                    .read(rideStateProvider.notifier)
                    .setStage(RideStage.waitingForDriver);
              },
              child: const Text('Request Ride'),
            ),
          ),
        ],
      ),
    );
  }
}