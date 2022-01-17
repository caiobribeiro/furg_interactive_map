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
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Image.network(
                store.urlOficialSite,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.web_rounded,
                  size: 24.0,
                ),
                label: Text('Visitar Site Oficial'),
                onPressed: () => _launchURL(),
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.65, 45),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.search_rounded,
                  size: 24.0,
                ),
                label: Text('Pesquisar na Universidade'),
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.65, 45),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () => {
                  print("Enviando"),
                  print(store.buildingName),
                  Modular.to.pushNamed('/search/pedro'),
                },
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
