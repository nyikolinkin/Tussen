import 'package:flutter/material.dart';

import '../data/pricing_repository.dart';
import '../domain/models/fare_estimate.dart';
import '../domain/services/fare_calculator.dart';

class FareController {
  final PricingRepository pricingRepository;
  final FareCalculator fareCalculator;

  const FareController({
    required this.pricingRepository,
    required this.fareCalculator,
  });

  FareEstimate estimateFare({
    required Offset pickup,
    required Offset destination,
  }) {
    final policy =
        pricingRepository.getCurrentPolicy();

    return fareCalculator.calculate(
      pickup: pickup,
      destination: destination,
      policy: policy,
    );
  }
}