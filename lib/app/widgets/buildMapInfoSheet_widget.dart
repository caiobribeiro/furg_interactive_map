import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/furgMap/furgMap_store.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildMapInfoSheetWidget extends StatelessWidget {
  final String title;
  const BuildMapInfoSheetWidget(
      {Key? key, this.title = "BuildMapInfoSheetWidget"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FurgMapStore store = Modular.get();
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    // final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = screenHeight - statusBarHeight;

    void _launchURL() async {
      String link = store.buildingOficialSite;
      if (await canLaunch(link)) {
        await launch(
          link,
          forceSafariVC: true, // IOS
          forceWebView: true, // Android
        );
      }
    }

    return Container(
      height: deviceHeight * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: IgnorePointer(
                child: Text(
                  "${store.buildingName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                  ),
                ),
              ),
            ),
            Image.network(
              store.urlOficialSite,
              width: deviceHeight * 0.3,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.web_rounded,
                  size: 24.0,
                ),
                label: Text('Visitar Site Oficial'),
                onPressed: () async {
                  _launchURL();
                },
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.search_rounded,
                  size: 24.0,
                ),
                label: Text('Pesquisar na Universidade'),
                onPressed: () async {
                  print("Enviando");
                  print(store.buildingName);
                  Modular.to.pushNamed('/search/pedro');
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
              child: Text(
                "${store.buildingDescription}",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
