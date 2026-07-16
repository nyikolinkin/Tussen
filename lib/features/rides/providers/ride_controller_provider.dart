import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/ride_controller.dart';

final rideControllerProvider = Provider(
  (ref) => RideController(ref),
);