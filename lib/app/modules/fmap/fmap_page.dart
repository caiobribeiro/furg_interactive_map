import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:furg_interactive_map/app/modules/fmap/fmap_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/buildEventSheet_widget.dart';
import 'package:furg_interactive_map/app/widgets/customDrewer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FmapPage extends StatefulWidget {
  @override
  _FmapPageState createState() => _FmapPageState();
}

class _FmapPageState extends ModularState<FmapPage, FmapStore> {
  final appStore = Modular.get<AppStore>();

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("Carreiros"),
      centerTitle: true,
      actions: [],
    );

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    // final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = screenHeight - appBarHeight - statusBarHeight;

    return Scaffold(
      appBar: appBar,
      drawer: DrawerCustom(),
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              Container(
                height: deviceHeight,
                child: Visibility(
                  visible: store.isAllMarkersFetched,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    zoomControlsEnabled: false,
                    initialCameraPosition: store.initialCameraPositionSmallHill,
                    onMapCreated: (GoogleMapController controller) {
                      store.googleMapController!.complete(controller);
                      store.setMapStyle();
                    },
                    markers: Set.from(store.allBuildings),
                    polygons: store.polygons,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text("data"),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.date_range,
                            size: 24.0,
                          ),
                          label: Text('Mais Informações'),
                          onPressed: () {
                            store.toggleBottonSheet();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.search_rounded,
                            size: 24.0,
                          ),
                          label: Text('Pesquisar Prédio'),
                          onPressed: () {
                            // phoneStore.searchPhoneListString =
                            //     store.buildingName!;

                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) => BuildEventSheetWidget(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Visibility(
                visible: store.isBottonSheetActivated,
                child: AnimatedOpacity(
                  opacity: store.isBottonSheetActivated ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: Column(
                    children: [
                      Container(
                        height: deviceHeight,
                        width: screenWidth,
                        decoration: new BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                          ),
                        ),
                        child: Observer(
                          builder: (_) {
                            return SingleChildScrollView(
                              child: new Container(
                                padding: EdgeInsets.fromLTRB(10, 18, 10, 2),
                                child: Stack(
                                  children: [
                                    Column(
                                      children: <Widget>[
                                        RawMaterialButton(
                                          onPressed: () {
                                            store.toggleBottonSheet();
                                          },
                                          elevation: 10.0,
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          child: Icon(
                                            Icons.close_rounded,
                                            size: 20.0,
                                          ),
                                          padding: EdgeInsets.all(8.0),
                                          shape: CircleBorder(),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          child: IgnorePointer(
                                            child: Text(
                                              "${store.buildingName}\n",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 26,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Image.network(
                                          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fencrypted-tbn0.gstatic.com%2Fimages%3Fq%3Dtbn%3AANd9GcQR-KiRO_wvDeoDAoLU7kd7zlaTak2e0u7iNHT5xqOrYW_z41BJ34g8GZ-h3tMAc7ZI_bk%26usqp%3DCAU&psig=AOvVaw0CJZHylTqFTBH0a2cBDePa&ust=1641326696532000&source=images&cd=vfe&ved=0CAoQ3YkBahcKEwiQ1PavsJb1AhUAAAAAHQAAAAAQAw",
                                          width: deviceHeight * 0.3,
                                        ),
                                        Text(
                                          "${store.buildingDescription}\n",
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
