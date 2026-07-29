import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_text_styles.dart';
import '../../providers/ride_state_provider.dart';
import '../widgets/driver_card.dart';

class DriverFoundScreen extends ConsumerWidget {
  const DriverFoundScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ride = ref.watch(rideStateProvider);

    final driver = ride.driver;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              const Icon(
                Icons.check_circle,
                size: 80,
                color: Colors.green,
              ),

              const SizedBox(height: 24),

              Text(
                'Driver Found!',
                style: AppTextStyles.heading1,
              ),

              const SizedBox(height: 12),

              Text(
                'We have matched you with the nearest available driver.',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              if (driver != null)
                DriverCard(driver: driver)
              else
                const CircularProgressIndicator(),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}