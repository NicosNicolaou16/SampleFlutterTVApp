import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplefluttertvapp/data/models/ship_details/ship_details_data_model.dart';
import 'package:samplefluttertvapp/views/ship_details_screen/ship_details_events/ship_details_events.dart';
import 'package:samplefluttertvapp/views/ship_details_screen/ship_details_states/ship_details_states.dart';

class ShipDetailsBloc extends Bloc<ShipDetailsEvents, ShipDetailsStates> {
  ShipDetailsBloc() : super(ShipDetailsStates()) {
    on<ShipDetailsLocalQuery>(_onShipsLocalSearch);
  }

  Future<void> _onShipsLocalSearch(
    ShipDetailsLocalQuery event,
    Emitter<ShipDetailsStates> emit,
  ) async {
    if (event.shipId != "-1") {
      emit(state.copyWith(
          shipDetailsStatus: ShipDetailsStatus.loaded,
          shipDetailsDataModelList:
              await ShipDetailsDataModel.createShipDetailsDataModel(
                  event.shipId)));
    } else {
      emit(state.copyWith(
        shipDetailsStatus: ShipDetailsStatus.error,
      ));
    }
  }
}
