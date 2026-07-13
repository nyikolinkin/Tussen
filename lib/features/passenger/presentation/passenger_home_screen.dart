import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/enums/location_type.dart';
import '../../../core/enums/passenger_tab.dart';
import '../../../core/providers/location_provider.dart';
import '../../../core/widgets/tussen_button.dart';
import '../../../core/widgets/tussen_location_card.dart';
import '../../passenger/presentation/scaffolds/passenger_scaffold.dart';
import '../../../features/rides/presentation/screens/searching_driver_screen.dart';

class PassengerHomeScreen extends ConsumerWidget {
  const PassengerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickupLocation = ref.watch(pickupLocationProvider);
    final destination = ref.watch(destinationProvider);

    return PassengerScaffold(
      currentTab: PassengerTab.home,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Where are you going today?',
            style: AppTextStyles.heading1,
          ),

          const SizedBox(height: 8),

          Text(
            'Choose your pickup and destination.',
            style: AppTextStyles.body,
          ),

          const SizedBox(height: 32),

          TussenLocationCard(
            icon: Icons.my_location,
            title: pickupLocation,
            onTap: () {
              context.push(
                AppRoutes.locationSearch,
                extra: LocationType.pickup,
              );
            },
          ),

          const SizedBox(height: 16),

          TussenLocationCard(
            icon: Icons.location_on,
            title: destination,
            onTap: () {
              context.push(
                AppRoutes.locationSearch,
                extra: LocationType.destination,
              );
            },
          ),

          const Spacer(),

          TussenButton(
            text: 'Request Ride',
            onPressed: () {
              context.push(AppRoutes.searchingDriver);
  },
          ),
        ],
      ),
    );
  }
}