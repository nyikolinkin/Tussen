import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/map_simulator.dart';
import 'map_state_provider.dart';

final mapSimulatorProvider = Provider<MapSimulator>((ref) {
  final notifier = ref.read(mapStateProvider.notifier);
  final state = ref.read(mapStateProvider);

  return MapSimulator(
    start: state.driverPosition,
    destination: state.pickupPosition,
    onDriverMoved: notifier.moveDriver,
  );
});