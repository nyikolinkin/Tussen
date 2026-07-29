import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/ride_controller.dart';
import 'ride_state_provider.dart';
import '../../../core/maps/providers/map_state_provider.dart';

// NEW
import 'driver_repository_provider.dart';

final rideControllerProvider = Provider<RideController>((ref) {
  return RideController(
    rideNotifier: ref.read(rideStateProvider.notifier),
    mapNotifier: ref.read(mapStateProvider.notifier),

    // NEW
    driverRepository: ref.read(driverRepositoryProvider),
  );
});