import 'dart:math';

import '../../../core/maps/models/map_driver.dart';
import '../data/repositories/driver_repository.dart';

class DispatchService {
  final Random _random = Random();

  Future<MapDriver?> dispatchRide({
    required List<MapDriver> candidates,
    required DriverRepository driverRepository,
  }) async {
    for (final mapDriver in candidates) {
      final driver = driverRepository.getById(mapDriver.id);

      print("Sending request to ${driver.name}...");

      await Future.delayed(
        Duration(
          seconds: driver.responseTime,
        ),
      );

      final accepted =
          _random.nextDouble() <= driver.acceptanceRate;

      if (accepted) {
        print("${driver.name} ACCEPTED");

        return mapDriver;
      }

      print("${driver.name} declined");
    }

    return null;
  }
}