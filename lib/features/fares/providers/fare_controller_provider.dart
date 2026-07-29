import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/fare_controller.dart';

import 'pricing_provider.dart';
import 'fare_calculator_provider.dart';

final fareControllerProvider =
    Provider<FareController>((ref) {
  return FareController(
    pricingRepository:
        ref.read(pricingRepositoryProvider),

    fareCalculator:
        ref.read(fareCalculatorProvider),
  );
});