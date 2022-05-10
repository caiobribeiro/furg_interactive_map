import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildMapInfoSheetWidget extends StatelessWidget {
  final String title;
  final String? buildingName;
  final String? buildingDescription;
  final String? buildingOficialSite;
  final String? buildingImageLink;
  final LatLng? buildingPostion;
  const BuildMapInfoSheetWidget({
    Key? key,
    this.title = "BuildMapInfoSheetWidget",
    required this.buildingName,
    this.buildingDescription,
    this.buildingOficialSite,
    this.buildingImageLink,
    this.buildingPostion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final deviceHeight = screenHeight - statusBarHeight;

    final AppStore _appStore = Modular.get<AppStore>();

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

    return _appStore.kTabletBreakpoint >= MediaQuery.of(context).size.width
        ? Container(
            height: deviceHeight * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: IgnorePointer(
                      child: Text(
                        "$buildingName",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 34,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: buildingImageLink != ""
                        ? Image.network(
                            "$buildingImageLink",
                          )
                        : Text("Imagem indisponível"),
                  ),
                  buildingName == "Estacionamento"
                      ? Container()
                      : Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.web_rounded,
                              size: 24.0,
                            ),
                            label: Text('Visitar Site Oficial'),
                            onPressed: () => _launchURL(buildingOficialSite),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.65, 45),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                  buildingName == "Estacionamento"
                      ? Container()
                      : Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.search_rounded,
                              size: 24.0,
                            ),
                            label: Text('Pesquisar na Universidade'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.65, 45),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () => {
                              Modular.to
                                  .navigate('/search', arguments: buildingName),
                            },
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.route_outlined,
                        size: 24.0,
                      ),
                      label: Text('Navegar'),
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.65, 45),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        _launchMapsUrl(buildingPostion!.latitude,
                            buildingPostion!.longitude);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "$buildingDescription",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            height: deviceHeight * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                    child: IgnorePointer(
                      child: Text(
                        "$buildingName",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                              child: buildingImageLink != ""
                                  ? Image.network(
                                      "$buildingImageLink",
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    )
                                  : Text("Imagem indisponível"),
                            ),
                            buildingName == "Estacionamento"
                                ? Container()
                                : Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: ElevatedButton.icon(
                                      icon: Icon(
                                        Icons.web_rounded,
                                        size: 24.0,
                                      ),
                                      label: Text('Visitar Site Oficial'),
                                      onPressed: () =>
                                          _launchURL(buildingOficialSite),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                            45),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                            buildingName == "Estacionamento"
                                ? Container()
                                : Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: ElevatedButton.icon(
                                      icon: Icon(
                                        Icons.search_rounded,
                                        size: 24.0,
                                      ),
                                      label: Text('Pesquisar na Universidade'),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                            45),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      onPressed: () => {
                                        Modular.to.navigate('/search',
                                            arguments: buildingName),
                                      },
                                    ),
                                  ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.route_outlined,
                                  size: 24.0,
                                ),
                                label: Text('Navegar'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.3,
                                      45),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  _launchMapsUrl(buildingPostion!.latitude,
                                      buildingPostion!.longitude);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            "$buildingDescription",
                            style: TextStyle(
                              fontSize: 22,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
