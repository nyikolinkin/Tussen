import 'dart:math';

import 'package:flutter/material.dart';

import '../models/fare_estimate.dart';
import '../models/pricing_policy.dart';

class FareCalculator {
  const FareCalculator();

  FareEstimate calculate({
    required Offset pickup,
    required Offset destination,
    required PricingPolicy policy,
  }) {
    // ======================================================
    // Calculate straight-line distance
    // (Temporary until Google Maps routing is added)
    // ======================================================

    final dx = destination.dx - pickup.dx;
    final dy = destination.dy - pickup.dy;

    final pixels = sqrt(dx * dx + dy * dy);

    // Temporary conversion
    const pixelsPerKilometre = 50.0;

    final kilometres = pixels / pixelsPerKilometre;

    // ======================================================
    // Fare calculation
    // ======================================================

    double fare =
        policy.baseFare +
        policy.bookingFee +
        (kilometres * policy.pricePerKm);

    // Enforce minimum fare
    if (fare < policy.minimumFare) {
      fare = policy.minimumFare;
    }

    return FareEstimate(
  distanceKm: kilometres,
  totalFare: double.parse(
    fare.toStringAsFixed(2),
  ),
);
  }
}