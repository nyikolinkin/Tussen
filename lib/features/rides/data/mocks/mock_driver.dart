import '../../../rides/domain/models/driver_card.dart';
import '../../../../core/enums/gender.dart';
import '../../../../core/enums/driver_status.dart';


const mockDriver = Driver(
  id: 'drv_001',
  name: 'Sipho M.',
  gender: Gender.male,
  status: DriverStatus.available,
  vehicle: 'Toyota Corolla',
  vehicleColor: 'White',
  registrationNumber: 'ABC 123 MP',
  rating: 4.9,
  etaMinutes: 3,
);