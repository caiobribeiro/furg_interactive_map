import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:furg_interactive_map/app/modules/fmap/fmap_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/customDrewer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FmapPage extends StatefulWidget {
  @override
  _FmapPageState createState() => _FmapPageState();
}

class _FmapPageState extends ModularState<FmapPage, FmapStore> {
  final appStore = Modular.get<AppStore>();
  final appBar = AppBar(
    title: Text('Carreiros'),
    centerTitle: true,
    actions: [],
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final deviceHeight = screenHeight - appBarHeight - statusBarHeight;

    return Scaffold(
      appBar: appBar,
      drawer: DrawerCustom(),
      body: Stack(
        children: <Widget>[
          Container(
            height: deviceHeight,
            child: Observer(
              builder: (_) {
                return Visibility(
                    visible: store.isAllMarkersFetched,
                    child: Hero(
                      tag: 'fmap',
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition:
                            store.initialCameraPositionSmallHill,
                        onMapCreated: (GoogleMapController controller) {
                          store.googleMapController!.complete(controller);
                          store.setMapStyle();
                        },
                        markers: Set.from(store.allBuildings),
                        polygons: store.polygons,
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
