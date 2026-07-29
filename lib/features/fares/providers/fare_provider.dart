import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/services/fare_calculator.dart';

final fareCalculatorProvider =
    Provider<FareCalculator>((ref) {
  return FareCalculator();
});