import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/moreLinks/moreLinks_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/customDrawer.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreLinksPage extends StatefulWidget {
  final String title;
  const MoreLinksPage({Key? key, this.title = 'Mais Links'}) : super(key: key);
  @override
  MoreLinksPageState createState() => MoreLinksPageState();
}

class MoreLinksPageState extends State<MoreLinksPage> {
  final MoreLinksStore store = Modular.get();

  void _launchURL(link) async {
    if (await canLaunch(link)) {
      await launch(
        link,
        forceSafariVC: true, // IOS
        forceWebView: true, // Android
        enableJavaScript: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              GestureDetector(
                onTap: () => _launchURL("https://www.furg.br/"),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    color: Colors.grey,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            'https://www.furg.br/arquivos/logo-furg.png',
                            // fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Container(
                            child: Text("FURG"),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // elevation: 2,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _launchURL("https://api.furg.br/account/login"),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    color: Colors.grey,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            'https://www.furg.br/arquivos/logo-furg.png',
                            // fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Container(
                            child: Text("Sistemas FURG"),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // elevation: 2,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => _launchURL("https://ava.furg.br/login/index.php"),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    color: Colors.grey,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            'https://www.furg.br/arquivos/logo-furg.png',
                            // fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Container(
                            child: Text("AVA FURG"),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // elevation: 2,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _launchURL("https://repositoriosi.com/index.php"),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Card(
                    color: Colors.grey,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            'https://img.elo7.com.br/product/main/347C7D8/matriz-sistema-de-informacao-sistema-de-informacao.jpg',
                            // fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Container(
                            child: Text("Repositório SI"),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // elevation: 2,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
