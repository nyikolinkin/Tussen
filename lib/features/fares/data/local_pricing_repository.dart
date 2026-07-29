import 'pricing_repository.dart';
import '../domain/models/pricing_policy.dart';

class LocalPricingRepository
    implements PricingRepository {
  const LocalPricingRepository();

  @override
  PricingPolicy getCurrentPolicy() {
    return const PricingPolicy(
      baseFare: 15,
      bookingFee: 5,
      pricePerKm: 8,
      pricePerMinute: 1.50,
      minimumFare: 30,
      cancellationFee: 20,
      waitingChargePerMinute: 1,
      commissionPercentage: 20,
    );
  }
}