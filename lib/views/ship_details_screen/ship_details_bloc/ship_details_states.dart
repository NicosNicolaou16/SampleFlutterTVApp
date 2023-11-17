import 'package:samplefluttertvapp/data/models/ship_details/ship_details_data_model.dart';

enum ShipDetailsStatus {
  initial,
  loading,
  loaded,
  error,
}

class ShipDetailsStates {
  String? error;
  int? statusCode;
  List<ShipDetailsDataModel> shipDetailsDataModelList;
  ShipDetailsStatus shipDetailsStatus;

  ShipDetailsStates({
    this.error,
    this.statusCode,
    this.shipDetailsDataModelList = const [],
    this.shipDetailsStatus = ShipDetailsStatus.initial,
  });

  ShipDetailsStates copyWith({
    error,
    statusCode,
    shipDetailsDataModelList,
    shipDetailsStatus,
  }) {
    return ShipDetailsStates(
      error: error ?? this.error,
      statusCode: statusCode ?? this.statusCode,
      shipDetailsDataModelList:
          shipDetailsDataModelList ?? this.shipDetailsDataModelList,
      shipDetailsStatus: shipDetailsStatus ?? this.shipDetailsStatus,
    );
  }
}
