import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local_pricing_repository.dart';
import '../data/pricing_repository.dart';

final pricingRepositoryProvider =
    Provider<PricingRepository>((ref) {
  return const LocalPricingRepository();
});