import '../../domain/models/driver.dart';

abstract class DriverRepository {
  Driver getById(String id);

  List<Driver> getAll();
}