import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildEventSheetWidget extends StatelessWidget {
  final String title;
  final String? eventOficialSite;
  final String? eventName;
  final String? eventDescription;
  final String? eventImageLink;
  final String? userFurgEmail;
  final String? eventStart;
  final String? eventEnd;
  final LatLng? eventPosition;

  const BuildEventSheetWidget({
    Key? key,
    this.title = "BuildEventSheetWidget",
    required this.eventOficialSite,
    required this.eventName,
    required this.eventDescription,
    required this.eventImageLink,
    required this.userFurgEmail,
    required this.eventPosition,
    this.eventStart,
    this.eventEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppStore _appStore = Modular.get<AppStore>();

    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final deviceHeight = screenHeight - statusBarHeight;

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

    return Observer(builder: (_) {
      return _appStore.kTabletBreakpoint >= MediaQuery.of(context).size.width
          ? SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
                      child: Text(
                        eventName!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: Container(
                        width: 400,
                        child: Image.network(
                          eventImageLink!,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Text('Imagem indisponível');
                          },
                        ),
                      ),
                    ),
                    eventStart != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text("Início: $eventStart"),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text("Término: $eventEnd"),
                              ),
                            ],
                          )
                        : Container(),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.web_rounded,
                          size: 24.0,
                        ),
                        label: Text('Visitar Site Oficial'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(330, 50),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          _launchURL(eventOficialSite);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.map_sharp,
                          size: 24.0,
                        ),
                        label: Text('Navegar'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(330, 50),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          _launchMapsUrl(eventPosition!.latitude,
                              eventPosition!.longitude);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
                      child: Text(
                        eventDescription!,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    userFurgEmail != null
                        ? Container(
                            child: Text("Responsável: $userFurgEmail"),
                          )
                        : Container(),
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
                          "$eventName",
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
                                child: eventImageLink != ""
                                    ? Image.network(
                                        "$eventImageLink",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                      )
                                    : Text("Imagem indisponível"),
                              ),
                              eventName == "Estacionamento"
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
                                            _launchURL(eventOficialSite),
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              45),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                              eventName == "Estacionamento"
                                  ? Container()
                                  : Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      child: ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.search_rounded,
                                          size: 24.0,
                                        ),
                                        label:
                                            Text('Pesquisar na Universidade'),
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              45),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        onPressed: () => {
                                          Modular.to.navigate('/search',
                                              arguments: eventName),
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
                                    _launchMapsUrl(eventPosition!.latitude,
                                        eventPosition!.longitude);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  "$eventDescription",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 50,
                                ),
                                userFurgEmail != null
                                    ? Container(
                                        margin: EdgeInsets.only(top: 50),
                                        child:
                                            Text("Responsável: $userFurgEmail"),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
