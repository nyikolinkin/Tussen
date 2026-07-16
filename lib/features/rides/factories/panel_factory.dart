import 'package:flutter/material.dart';

import '../../rides/domain/models/ride_state.dart';
import '../../rides/domain/models/ride_stage.dart';

import '../../rides/presentation/panels/searching_panel.dart';
import '../../rides/presentation/panels/driver_found_panel.dart';
import '../../rides/presentation/panels/ride_accepted_panel.dart';
import '../../rides/presentation/panels/waiting_panel.dart';
import '../../rides/presentation/panels/driver_arriving_panel.dart';
import '../../rides/presentation/panels/driver_arrived_panel.dart';
import '../../rides/presentation/panels/trip_started_panel.dart';
import '../../rides/presentation/panels/trip_in_progress_panel.dart';
import '../../rides/presentation/panels/trip_completed_panel.dart';

class PanelFactory {
  const PanelFactory._();

  static Widget build(RideState state) {
    switch (state.stage) {
  case RideStage.searching:
    return const SearchingPanel();

    case RideStage.driverFound:
    return DriverFoundPanel(
      driver: state.driver!,
    );

    case RideStage.waitingForDriver:
    return WaitingPanel(
      driver: state.driver!,
    );

    case RideStage.accepted:
      return RideAcceptedPanel(
      driver: state.driver!,
      );

    case RideStage.driverArriving:
      return DriverArrivingPanel(
      driver: state.driver!,
      );

      case RideStage.driverArrived:
        return DriverArrivedPanel(
        driver: state.driver!,
        );

      case RideStage.tripStarted:
        return TripStartedPanel(driver: state.driver!);

      case RideStage.tripInProgress:
        return TripInProgressPanel(driver: state.driver!);

      case RideStage.tripCompleted:
        return const TripCompletedPanel();

      default:
      return const SearchingPanel();
    }
  }
}