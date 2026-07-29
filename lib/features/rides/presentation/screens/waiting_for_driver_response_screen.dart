import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_text_styles.dart';
import '../../providers/ride_state_provider.dart';
import '../widgets/driver_card.dart';

class WaitingForDriverResponseScreen extends ConsumerWidget {
  const WaitingForDriverResponseScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ride = ref.watch(rideStateProvider);
    final driver = ride.driver;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),

            const CircularProgressIndicator(),

            const SizedBox(height: 30),

            Text(
              driver != null
                  ? 'Waiting for ${driver.name}'
                  : 'Finding your driver...',
              style: AppTextStyles.heading1,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Text(
              'Your ride request has been sent.',
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            if (driver != null)
              DriverCard(driver: driver),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}