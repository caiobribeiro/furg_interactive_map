import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/eventsManagement/eventsManagement_store.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildEventSheetWidget extends StatelessWidget {
  final String title;
  const BuildEventSheetWidget({Key? key, this.title = "BuildEventSheetWidget"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsManagementStore store = Modular.get();

    void _launchURL() async {
      String link = store.eventOficialSite;
      if (await canLaunch(link)) {
        await launch(
          link,
          forceSafariVC: true, // IOS
          forceWebView: true, // Android
        );
      }
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Image.network(store.eventImageLink),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
            child: Text(
              store.eventName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
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
            margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
            child: Text(
              store.eventDescription,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
