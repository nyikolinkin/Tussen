import '../../../../core/enums/driver_status.dart';
import '../../../../core/enums/gender.dart';

import '../../domain/models/driver.dart';
import 'driver_repository.dart';

class LocalDriverRepository implements DriverRepository {
  const LocalDriverRepository();

  static const List<Driver> _drivers = [
    Driver(
      id: 'driver_1',
      name: 'Sipho M.',
      gender: Gender.male,
      vehicle: 'Toyota Corolla',
      vehicleColor: 'White',
      registrationNumber: 'ABC 123 GP',
      rating: 4.9,
      etaMinutes: 3,
      status: DriverStatus.available,
      acceptanceRate: 0.95,
      responseTime: 2,
      averageSpeed: 16,
    ),
    Driver(
      id: 'driver_2',
      name: 'Thabo K.',
      gender: Gender.male,
      vehicle: 'VW Polo',
      vehicleColor: 'Blue',
      registrationNumber: 'XYZ 456 GP',
      rating: 4.7,
      etaMinutes: 5,
      status: DriverStatus.available,
      acceptanceRate: 0.80,
      responseTime: 6,
      averageSpeed: 18,
    ),
    Driver(
      id: 'driver_3',
      name: 'Lerato N.',
      gender: Gender.female,
      vehicle: 'Toyota Starlet',
      vehicleColor: 'Silver',
      registrationNumber: 'LMN 789 GP',
      rating: 4.8,
      etaMinutes: 4,
      status: DriverStatus.available,
      acceptanceRate: 0.98,
      responseTime: 3,
      averageSpeed: 15,
    ),
  ];

  @override
  Driver getById(String id) {
    return _drivers.firstWhere((driver) => driver.id == id);
  }

  @override
  List<Driver> getAll() {
    return List.unmodifiable(_drivers);
  }
}