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
  final int etaMinutes;

  final DriverStatus status;

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
  });
}