import 'dart:convert';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/allBuildings/allBuildings_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/customDrawer.dart';
import 'package:furg_interactive_map/models/coordinates/polygon_coordinates.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AllBuildingsPage extends StatefulWidget {
  final String title;
  const AllBuildingsPage({Key? key, this.title = 'Todos os Prédios'})
      : super(key: key);
  @override
  AllBuildingsPageState createState() => AllBuildingsPageState();
}

class AllBuildingsPageState extends State<AllBuildingsPage> {
  final AllBuildingsStore store = Modular.get();

  @override
  void initState() {
    loadAllBuildingsJsonWithOutParkingSpot();
    super.initState();
  }

  Future loadAllBuildingsJsonWithOutParkingSpot() async {
    store.allPolygonBuildingsJson = await rootBundle
        .loadString('assets/coordinates/mapa_interativo_furg_att.json');
    // * Decode json file

    final jsonPolygons = jsonDecode(store.allPolygonBuildingsJson!);
    store.jsonDecodedLatLngPolygons = PolygonCoordinates.fromJson(jsonPolygons);
    store.searchResult = PolygonCoordinates.fromJson(jsonPolygons);
    store.isAllBuildingetched = true;
    return store.jsonDecodedLatLngPolygons;
  }

  Future searchAllBuildings() async {
    List<String> listBuildingName = [];
    List<String> listBuildingDescrptions = [];
    List<String> listBuildingSite = [];
    List<String> listBuildingImage = [];
    List<LatLng> listBuildingLocation = [];
    for (var i = 0; i < store.jsonDecodedLatLngPolygons.features!.length; i++) {
      final titleLower = store
          .jsonDecodedLatLngPolygons.features![i].properties.name
          .toLowerCase();
      if (titleLower.contains(store.searchQuery) &&
          store.searchQuery.isNotEmpty) {
        listBuildingName
            .add(store.jsonDecodedLatLngPolygons.features![i].properties.name);

        if (store.jsonDecodedLatLngPolygons.features![i].properties
                .description !=
            null) {
          listBuildingDescrptions.add(store
              .jsonDecodedLatLngPolygons.features![i].properties.description);
        } else {
          listBuildingDescrptions.add("Descrição indisponível");
        }

        if (store.jsonDecodedLatLngPolygons.features![i].properties
                .oficialSite !=
            null) {
          listBuildingSite.add(store
              .jsonDecodedLatLngPolygons.features![i].properties.oficialSite);
        } else {
          listBuildingSite.add("Indisponível");
        }

        if (store.jsonDecodedLatLngPolygons.features![i].properties
                .imageBuilding !=
            "") {
          listBuildingImage.add(store
              .jsonDecodedLatLngPolygons.features![i].properties.imageBuilding);
        } else {
          listBuildingImage.add("Imagem indisponível");
        }
        listBuildingLocation.add(
          LatLng(
              store.jsonDecodedLatLngPolygons.features![i].geometry
                  .coordinates[0].last.last,
              store.jsonDecodedLatLngPolygons.features![i].geometry
                  .coordinates[0].first.first),
        );
      }
    }
    void _launchURL(link) async {
      if (await canLaunch(link)) {
        await launch(
          link,
          forceSafariVC: true, // IOS
          forceWebView: true, // Android
        );
      }
    }

    void _launchMapsUrl(double lat, double lon) async {
      final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listBuildingName.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "${listBuildingName[index]}",
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: listBuildingImage[index] ==
                                            "Imagem indisponível"
                                        ? Text(listBuildingImage[index])
                                        : Image.network(
                                            listBuildingImage[index]),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        "${listBuildingDescrptions[index]}",
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              20),
                                        ),
                                        onPressed: () {
                                          _launchURL(listBuildingSite[index]);
                                        },
                                        label: Text("Site Oficial"),
                                        icon: const Icon(Icons.web_rounded),
                                      ),
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              20),
                                        ),
                                        onPressed: () {
                                          _launchMapsUrl(
                                              listBuildingLocation
                                                  .last.latitude,
                                              listBuildingLocation
                                                  .last.longitude);
                                        },
                                        label: const Text('Navegar'),
                                        icon: const Icon(Icons.route_outlined),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ]),
        );
      },
    );
    return store.jsonDecodedLatLngPolygons;
  }

  @override
  Widget build(BuildContext context) {
    void _launchURL(link) async {
      if (await canLaunch(link)) {
        await launch(
          link,
          forceSafariVC: true, // IOS
          forceWebView: true, // Android
        );
      }
    }

    void _launchMapsUrl(double lat, double lon) async {
      final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: DrawerCustom(),
      body: Observer(builder: (_) {
        return Container(
          child: store.isAllBuildingetched
              ? Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white30,
                          border: OutlineInputBorder(),
                          hintText: 'Pesquisar',
                        ),
                        onChanged: store.setSearchQuery,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.search,
                          size: 24.0,
                        ),
                        label: Text('Pesquisar'),
                        onPressed: () {
                          searchAllBuildings();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.65, 45),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: store
                                .jsonDecodedLatLngPolygons.features!.length,
                            itemBuilder: (context, index) {
                              return store.jsonDecodedLatLngPolygons
                                          .features![index].properties.name !=
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
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Column(
                                                  children: [
                                                    store
                                                                .jsonDecodedLatLngPolygons
                                                                .features![
                                                                    index]
                                                                .properties
                                                                .imageBuilding ==
                                                            ""
                                                        ? Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(0, 0,
                                                                    0, 10),
                                                            child: Text(
                                                                "Imagem Indisponível"),
                                                          )
                                                        : Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(0, 0,
                                                                    0, 10),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.6,
                                                            child: Image.network(store
                                                                .jsonDecodedLatLngPolygons
                                                                .features![
                                                                    index]
                                                                .properties
                                                                .imageBuilding),
                                                          ),
                                                    store
                                                                .jsonDecodedLatLngPolygons
                                                                .features![
                                                                    index]
                                                                .properties
                                                                .description ==
                                                            null
                                                        ? Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(0, 10,
                                                                    0, 10),
                                                            child: Text(
                                                                "Descrição Indisponível"),
                                                          )
                                                        : Text(
                                                            "${store.jsonDecodedLatLngPolygons.features![index].properties.description}",
                                                          ),
                                                  ],
                                                )),
                                            ButtonBar(
                                              alignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton.icon(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    fixedSize: Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        20),
                                                  ),
                                                  onPressed: () {
                                                    _launchURL(store
                                                        .jsonDecodedLatLngPolygons
                                                        .features![index]
                                                        .properties
                                                        .oficialSite);
                                                  },
                                                  label: Text("Site Oficial"),
                                                  icon: const Icon(
                                                      Icons.web_rounded),
                                                ),
                                                ElevatedButton.icon(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    fixedSize: Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        20),
                                                  ),
                                                  onPressed: () {
                                                    _launchMapsUrl(
                                                        store
                                                            .jsonDecodedLatLngPolygons
                                                            .features![index]
                                                            .geometry
                                                            .coordinates[0]
                                                            .last
                                                            .last,
                                                        store
                                                            .jsonDecodedLatLngPolygons
                                                            .features![index]
                                                            .geometry
                                                            .coordinates[0]
                                                            .first
                                                            .first);
                                                  },
                                                  label: const Text('Navegar'),
                                                  icon: const Icon(
                                                      Icons.route_outlined),
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
                            }),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      }),
    );
  }
}
