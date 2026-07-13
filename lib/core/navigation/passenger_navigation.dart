import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router/app_routes.dart';

class PassengerNavigation {
  static void navigate(
    BuildContext context,
    int index,
  ) {
    switch (index) {
      case 0:
        context.go(AppRoutes.passengerHome);
        break;

      case 1:
        context.go(AppRoutes.trips);
        break;

      case 2:
        context.go(AppRoutes.wallet);
        break;

      case 3:
        context.go(AppRoutes.profile);
        break;
    }
  }
}