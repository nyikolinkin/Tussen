import '../../../rides/domain/models/driver.dart';
import '../../../../core/enums/gender.dart';
import '../../../../core/enums/driver_status.dart';

const mockDriver = Driver(
  id: 'drv_001',
  name: 'Sipho M.',
  vehicle: 'Toyota Corolla',
  vehicleColor: 'White',
  registrationNumber: 'ABC 123 MP',
  rating: 4.9,
  etaMinutes: 3,
  gender: Gender.male,
  status: DriverStatus.available,
);