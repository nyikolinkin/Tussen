import 'package:flutter_riverpod/flutter_riverpod.dart';

final pickupLocationProvider =
    StateProvider<String>((ref) => 'Pickup Location');

final destinationProvider =
    StateProvider<String>((ref) => 'Destination');