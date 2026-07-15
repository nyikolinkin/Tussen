import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/ride_state_provider.dart';
import '../panels/searching_panel.dart';
import '../widgets/ride_stage_panel.dart';

class RideTrackingScreen extends ConsumerWidget {
  const RideTrackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(rideStateProvider); // We'll use this later

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Tracking'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.grey.shade300,
            child: const Center(
              child: Text(
                'Google Map Placeholder',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),

          const Align(
            alignment: Alignment.bottomCenter,
            child: RideStagePanel(),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(rideStateProvider.notifier).nextStage();
        },
        icon: const Icon(Icons.bug_report),
        label: const Text('Next Stage'),
      ),
    );
  }
}