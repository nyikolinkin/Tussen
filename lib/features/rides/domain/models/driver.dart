import '../../../../core/enums/driver_status.dart';
import '../../../../core/enums/gender.dart';

class Driver {
  final String id;
  final String name;

  final Gender gender;

  final String vehicle;
  final String vehicleColor;
  final String registrationNumber;

  final double rating;

  /// Current ETA shown in the UI.
  final int etaMinutes;

  final DriverStatus status;

  // ==========================================================
  // Driver personality
  // ==========================================================

  /// Chance that the driver accepts a ride.
  /// Example: 0.95 = 95%
  final double acceptanceRate;

  /// Seconds before replying to a request.
  final int responseTime;

  /// Average driving speed in meters/second.
  /// Example: 15 = 54 km/h
  final double averageSpeed;

  const Driver({
    required this.id,
    required this.name,
    required this.gender,
    required this.vehicle,
    required this.vehicleColor,
    required this.registrationNumber,
    required this.rating,
    required this.etaMinutes,
    required this.status,

    required this.acceptanceRate,
    required this.responseTime,
    required this.averageSpeed,
  });
}