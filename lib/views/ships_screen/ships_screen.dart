import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplefluttertvapp/data/models/ships/ships_data_model.dart';
import 'package:samplefluttertvapp/utils/alerts_dialog/alerts_dialog.dart';
import 'package:samplefluttertvapp/views/ships_screen/ships_bloc/ships_bloc.dart';
import 'package:samplefluttertvapp/views/ships_screen/ships_bloc/ships_events.dart';
import 'package:samplefluttertvapp/views/ships_screen/ships_bloc/ships_states.dart';

import '../ship_details_screen/ship_details_screen.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({Key? key}) : super(key: key);

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  _init(BuildContext context) {
    context.read<ShipsBloc>().add(ShipsFetchData());
    context.read<ShipsBloc>().add(ShipsFromLocalDatabase());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Ships List",
            style: TextStyle(
              fontSize: 21,
            ),
          ),
        ),
        body: BlocProvider(
          create: (_) => ShipsBloc(),
          child: BlocConsumer<ShipsBloc, ShipsStates>(
            listener: (context, state) {
              if (state.shipStatus == ShipStatus.error) {
                AlertsDialog.showAlertDialog(state.error ?? "", context);
              }
            },
            builder: (context, state) {
              return _states(state, context);
            },
          ),
        ),
      ),
    );
  }

  Widget _states(ShipsStates state, BuildContext context) {
    if (state.shipStatus == ShipStatus.initial) {
      _init(context);
    } else if (state.shipStatus == ShipStatus.loaded) {
      return _mainView(state, context);
    } else if (state.shipStatus == ShipStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return _mainView(state, context);
  }

  Widget _mainView(ShipsStates state, BuildContext context) {
    return _listOfShips(state.shipsDataModelList);
  }

  Widget _listOfShips(List<ShipsDataModel> shipsDataModelList) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: shipsDataModelList.length,
          itemBuilder: (context, index) {
            ShipsDataModel shipsDataModel = shipsDataModelList[index];
            return Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: shipsDataModel.shipsInnerDataModel.length,
                  itemBuilder: (context, index) {
                    ShipsInnerDataModel shipsInnerDataModel =
                        shipsDataModel.shipsInnerDataModel[index];
                    return _cardView(shipsInnerDataModel);
                  }),
            );
          }),
    );
  }

  Widget _cardView(ShipsInnerDataModel shipsInnerDataModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShipDetailsScreen(
                    shipId: shipsInnerDataModel.shipsEntity.id ?? "-1",
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 200,
        width: 300,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.grey,
          elevation: 9,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: CachedNetworkImage(
                  imageUrl: shipsInnerDataModel.shipsEntity.image ?? "",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.image),
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  shipsInnerDataModel.shipsEntity.shipName ?? "",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  shipsInnerDataModel.shipsEntity.shipType ?? "",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
