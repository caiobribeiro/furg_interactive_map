import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/fmap/fmap_store.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FmapPage extends StatefulWidget {
  @override
  FmapPageState createState() => FmapPageState();
}

class FmapPageState extends State<FmapPage> {
  final FmapStore store = Modular.get();
  final appBar = AppBar(
    title: Text('Carreiros'),
  );
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final deviceHeight = screenHeight - appBarHeight - statusBarHeight;
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          Container(
            height: deviceHeight,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
            ),
          ),
        ],
      ),
    );
  }
}
