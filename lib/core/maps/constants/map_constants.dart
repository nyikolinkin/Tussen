class MapConstants {
  MapConstants._();

  // ==========================================================
  // Distance
  // ==========================================================

  /// 1 map unit represents 5 real-world meters.
  static const double metersPerUnit = 5.0;

  // ==========================================================
  // Vehicle speed
  // ==========================================================

  /// Average taxi speed.
  /// 15 m/s ≈ 54 km/h
  static const double averageSpeedMetersPerSecond = 15.0;

  // ==========================================================
  // Animation
  // ==========================================================

  /// Simulator updates every 50ms.
  static const Duration simulationTick = Duration(milliseconds: 50);

  /// How many map units the vehicle moves every tick.
  static const double unitsPerTick = 2.0;
}