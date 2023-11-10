import 'package:samplefluttertvapp/data/database/entities/ships_entity.dart';

class ShipsDataModel {
  final List<ShipsInnerDataModel> shipsInnerDataModel;

  ShipsDataModel(this.shipsInnerDataModel);

  static Future<List<ShipsDataModel>> createShipsDataModel(
      List<ShipsEntity> shipsEntityList) async {
    List<ShipsDataModel> shipsDataModelList = [];

    for (int i = 0; i < 10; i++) {
      List<ShipsInnerDataModel> shipsInnerList = [];
      shipsEntityList.forEach((shipsEntity) {
        shipsInnerList.add(ShipsInnerDataModel(shipsEntity));
      });
      shipsDataModelList.add(ShipsDataModel(shipsInnerList));
    }

    return shipsDataModelList;
  }
}

class ShipsInnerDataModel {
  final ShipsEntity shipsEntity;

  ShipsInnerDataModel(this.shipsEntity);
}
