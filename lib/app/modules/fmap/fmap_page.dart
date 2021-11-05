import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:furg_interactive_map/app/modules/fmap/fmap_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/customDrewer.dart';
import 'dart:io' show Platform;
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
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = screenHeight - appBarHeight - statusBarHeight;
    if (Platform.isAndroid) {
      return Scaffold(
        appBar: appBar,
        drawer: DrawerCustom(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showSearch(context: context, delegate: BuildingSearch());
          },
          child: const Icon(Icons.search),
          backgroundColor: ColorScheme.dark().background,
        ),
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
                      initialCameraPosition:
                          store.initialCameraPositionSmallHill,
                      onMapCreated: (GoogleMapController controller) {
                        store.googleMapController!.complete(controller);
                        store.setMapStyle();
                      },
                      markers: Set.from(store.allBuildings),
                      polygons: store.polygons,
                    ),
                  ),
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
                                            fillColor:
                                                Theme.of(context).accentColor,
                                            child: Icon(
                                              Icons.close_rounded,
                                              size: 20.0,
                                            ),
                                            padding: EdgeInsets.all(8.0),
                                            shape: CircleBorder(),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
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
                                            "https://i.scdn.co/image/ab67616d0000b273d8c513cf668050da6b092e7e",
                                            width: deviceHeight * 0.3,
                                          ),
                                          ListTile(
                                            leading: new Icon(Icons.photo),
                                            tileColor:
                                                Colors.black.withOpacity(0.6),
                                            focusColor:
                                                Colors.black.withOpacity(0.6),
                                            title: new Text('Photo'),
                                            onTap: () {
                                              store.toggleBottonSheet();
                                            },
                                          ),
                                          Text(
                                            "${store.buildingDescription}\n",
                                            style: TextStyle(
                                              fontSize: 22,
                                            ),
                                          ),
                                          Text(
                                            "wuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofghwuofgh",
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
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Google Maps."),
        ),
        // body: Container(child: getMap()),
      );
    }
  }
}

class BuildingSearch extends SearchDelegate<String?> {
  final exemplos = [
    'C3',
    'CC',
    'Cidec',
    'RU',
  ];

  final sugestoes = [
    'deus',
    'Cé',
    'cantor',
  ];

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.textsms),
            ),
            Text(query),
          ],
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    final recentSearch = query.isEmpty
        ? sugestoes
        : exemplos.where((exemplo) {
            final cityLower = exemplo.toLowerCase();
            final queryLower = query.toLowerCase();

            return queryLower.startsWith(queryLower);
          }).toList();
    return buildSuggestionsSuccess(recentSearch);
  }

  Widget buildSuggestionsSuccess(List<String> sugestoes) => ListView.builder(
        itemCount: sugestoes.length,
        itemBuilder: (BuildContext context, int index) {
          final sugestao = sugestoes[index];
          return ListTile(
            title: Text(sugestao),
            leading: Icon(Icons.ac_unit),
          );
        },
      );
}
