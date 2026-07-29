import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/driver_repository.dart';
import '../data/repositories/local_driver_repository.dart';

final driverRepositoryProvider =
    Provider<DriverRepository>((ref) {
  return const LocalDriverRepository();
});