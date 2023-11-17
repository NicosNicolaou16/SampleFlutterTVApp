import 'package:samplefluttertvapp/data/models/ships/ships_data_model.dart';

enum ShipStatus {
  initial,
  loading,
  loaded,
  error,
}

final class ShipsStates {
  String? error;
  int? statusCode;
  List<ShipsDataModel> shipsDataModelList;
  ShipStatus shipStatus;

  ShipsStates({
    this.error,
    this.statusCode,
    this.shipsDataModelList = const [],
    this.shipStatus = ShipStatus.initial,
  });

  ShipsStates copyWith({
    error,
    statusCode,
    shipsDataModelList,
    shipStatus,
  }) {
    return ShipsStates(
      error: error ?? this.error,
      statusCode: statusCode ?? this.statusCode,
      shipsDataModelList: shipsDataModelList ?? this.shipsDataModelList,
      shipStatus: shipStatus ?? this.shipStatus,
    );
  }
}
