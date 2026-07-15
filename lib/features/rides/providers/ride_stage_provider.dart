import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/ride_stage.dart';

final rideStageProvider =
    StateProvider<RideStage>((ref) => RideStage.searching);