import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_text_styles.dart';
import '../../providers/ride_state_provider.dart';
import '../widgets/driver_card.dart';
import '../widgets/map_placeholder.dart';

class DriverArrivingScreen extends ConsumerWidget {
  const DriverArrivingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rideState = ref.watch(rideStateProvider);
    final driver = rideState.driver;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver is on the way'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your driver is arriving',
                style: AppTextStyles.heading1,
              ),

              const SizedBox(height: 8),

              Text(
                'Estimated arrival: ${driver?.etaMinutes ?? '--'} minutes',
                style: AppTextStyles.body,
              ),

              const SizedBox(height: 24),

              const MapPlaceholder(),

              const SizedBox(height: 24),

              if (driver != null)
                DriverCard(driver: driver)
              else
                const Center(
                  child: CircularProgressIndicator(),
                ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}