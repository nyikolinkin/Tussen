import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ride_controller.dart';

final rideControllerProvider = Provider<RideController>(
  (ref) => RideController(ref),
);