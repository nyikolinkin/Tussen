import '../domain/models/pricing_policy.dart';

abstract class PricingRepository {
  PricingPolicy getCurrentPolicy();
}