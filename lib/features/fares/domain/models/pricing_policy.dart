class PricingPolicy {
  final double baseFare;
  final double bookingFee;
  final double pricePerKm;
  final double pricePerMinute;
  final double minimumFare;
  final double cancellationFee;
  final double waitingChargePerMinute;
  final double commissionPercentage;

  const PricingPolicy({
    required this.baseFare,
    required this.bookingFee,
    required this.pricePerKm,
    required this.pricePerMinute,
    required this.minimumFare,
    required this.cancellationFee,
    required this.waitingChargePerMinute,
    required this.commissionPercentage,
  });
}