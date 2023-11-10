import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplefluttertvapp/data/models/ship_details/ship_details_data_model.dart';
import 'package:samplefluttertvapp/utils/alerts_dialog/alerts_dialog.dart';
import 'package:samplefluttertvapp/views/ship_details_screen/ship_details_bloc.dart';
import 'package:samplefluttertvapp/views/ship_details_screen/ship_details_events/ship_details_events.dart';
import 'package:samplefluttertvapp/views/ship_details_screen/ship_details_states/ship_details_states.dart';

class ShipDetailsScreen extends StatefulWidget {
  final String shipId;

  const ShipDetailsScreen({Key? key, required this.shipId}) : super(key: key);

  @override
  State<ShipDetailsScreen> createState() => _ShipDetailsScreenState();
}

class _ShipDetailsScreenState extends State<ShipDetailsScreen> {
  _init(BuildContext context) {
    context.read<ShipDetailsBloc>().add(ShipDetailsLocalQuery(widget.shipId));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Details Screen",
            style: TextStyle(
              fontSize: 21,
            ),
          ),
        ),
        body: BlocProvider(
          create: (_) => ShipDetailsBloc(),
          child: BlocConsumer<ShipDetailsBloc, ShipDetailsStates>(
            listener: (context, state) {
              if (state.shipDetailsStatus == ShipDetailsStatus.error) {
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

  Widget _states(ShipDetailsStates state, BuildContext context) {
    if (state.shipDetailsStatus == ShipDetailsStatus.initial) {
      _init(context);
    } else if (state.shipDetailsStatus == ShipDetailsStatus.loaded) {
      return _mainView(state, context);
    } else if (state.shipDetailsStatus == ShipDetailsStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return _mainView(state, context);
  }

  Widget _mainView(ShipDetailsStates state, BuildContext context) {
    return ListView.builder(
        itemCount: state.shipDetailsDataModelList.length,
        itemBuilder: (context, index) {
          ShipDetailsDataModel shipDetailsDataModel =
              state.shipDetailsDataModelList[index];
          if (shipDetailsDataModel.shipDetailsViewType ==
              ShipDetailsViewType.PHOTO_VIEW_TYPE) {
            return _imageView(shipDetailsDataModel);
          } else {
            return _infoView(shipDetailsDataModel);
          }
        });
  }

  Widget _imageView(ShipDetailsDataModel shipDetailsDataModel) {
    return CachedNetworkImage(
      imageUrl: shipDetailsDataModel.shipsEntity.image ?? "",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.image),
      height: 300,
      width: 50,
    );
  }

  Widget _infoView(ShipDetailsDataModel shipDetailsDataModel) {
    return Center(
      child: Column(
        children: [
          Text(
            shipDetailsDataModel.shipsEntity.shipName ?? "",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          Text(
            shipDetailsDataModel.shipsEntity.shipType ?? "",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
