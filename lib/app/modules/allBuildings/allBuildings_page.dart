import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/allBuildings/allBuildings_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/customDrawer.dart';
import 'package:furg_interactive_map/models/coordinates/polygon_coordinates.dart';
import 'package:flutter/services.dart' show rootBundle;

class AllBuildingsPage extends StatefulWidget {
  final String title;
  const AllBuildingsPage({Key? key, this.title = 'AllBuildingsPage'})
      : super(key: key);
  @override
  AllBuildingsPageState createState() => AllBuildingsPageState();
}

class AllBuildingsPageState extends State<AllBuildingsPage> {
  final AllBuildingsStore store = Modular.get();

  Future loadAllBuildingsJsonWithOutParkingSpot() async {
    store.allPolygonBuildingsJson = await rootBundle
        .loadString('assets/coordinates/mapa_interativo_furg_att.json');
    // * Decode json file

    final jsonPolygons = jsonDecode(store.allPolygonBuildingsJson!);
    store.jsonDecodedLatLngPolygons = PolygonCoordinates.fromJson(jsonPolygons);

    return store.jsonDecodedLatLngPolygons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerCustom(),
      body: FutureBuilder(
        future: loadAllBuildingsJsonWithOutParkingSpot(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          store.jsonDecodedLatLngPolygons.features!.length,
                      itemBuilder: (context, index) {
                        return store.jsonDecodedLatLngPolygons.features![index]
                                    .properties.name !=
                                'Estacionamento'
                            ? Container(
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          "${store.jsonDecodedLatLngPolygons.features![index].properties.name}",
                                          style: TextStyle(
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            "${store.jsonDecodedLatLngPolygons.features![index].properties.description}",
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.6)),
                                          )),
                                      ButtonBar(
                                        alignment: MainAxisAlignment.start,
                                        children: [
                                          TextButton(
                                            style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.blue),
                                            ),
                                            onPressed: () {},
                                            child: Text('Site'),
                                          ),
                                        ],
                                      ),
                                      // Image.asset('assets/card-sample-image.jpg'),
                                      // Image.asset('assets/card-sample-image-2.jpg'),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                child: Text("nao"),
                              );
                      })
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
