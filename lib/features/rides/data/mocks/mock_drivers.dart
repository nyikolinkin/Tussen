import '../../domain/models/driver_card.dart';
import '../../../../core/enums/gender.dart';
import '../../../../core/enums/driver_status.dart';

const mockDrivers = [
  Driver(
    id: 'drv_001',
    name: 'Thandi M.',
    gender: Gender.female,
    status: DriverStatus.available,
    vehicle: 'Toyota Starlet',
    vehicleColor: 'White',
    registrationNumber: 'KXY 214 MP',
    rating: 5.0,
    etaMinutes: 2,
  ),

  Driver(
    id: 'drv_002',
    name: 'Sipho M.',
    gender : Gender.male,
    status: DriverStatus.available,
    vehicle: 'VW Polo',
    vehicleColor: 'Silver',
    registrationNumber: 'LMT 447 MP',
    rating: 4.9,
    etaMinutes: 3,
  ),

  Driver(
    id: 'drv_003',
    name: 'Sarah N.',
    gender: Gender.female,
    status: DriverStatus.available,
    vehicle: 'Suzuki Swift',
    vehicleColor: 'Red',
    registrationNumber: 'PJK 102 MP',
    rating: 4.8,
    etaMinutes: 4,
  ),

  Driver(
    id: 'drv_004',
    name: 'Brian K.',
    gender: Gender.male,
    status: DriverStatus.offline,
    vehicle: 'Toyota Corolla',
    vehicleColor: 'Blue',
    registrationNumber: 'MNR 855 MP',
    rating: 4.7,
    etaMinutes: 5,
  ),
];