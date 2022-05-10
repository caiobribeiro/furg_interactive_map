import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/aboutTheProject/aboutTheProject_store.dart';
import 'package:flutter/material.dart';
// import 'package:furg_interactive_map/app/widgets/customAvatarCard_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTheProjectPage extends StatefulWidget {
  final String title;
  const AboutTheProjectPage({Key? key, this.title = 'Sobre o projeto'})
      : super(key: key);
  @override
  AboutTheProjectPageState createState() => AboutTheProjectPageState();
}

class AboutTheProjectPageState extends State<AboutTheProjectPage> {
  final AboutTheProjectStore store = Modular.get();

  Future sendEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'caio_ribeiro@protonmail.com',
      query:
          'subject=App Feedback&body=App Version 3.23', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sobre o Mapa Interativo FURG",
                      style: TextStyle(
                          fontStyle: FontStyle.normal, fontSize: 28.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "O objetivo do projeto é possibilitar ampliar a experiência da comunidade acadêmica, contribuir para o sentido de pertencimento dos diferentes atores, permitir uma melhor experiência para os visitantes, tanto em eventos quanto em atividades rotineiras na Universidade.\nO projeto tem seu código aberto e disponível no GitHub.",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                child: Container(
              color: Colors.grey,
              width: double.infinity,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/caio.jpg'),
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Caio Beraldi Ribeiro",
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
                      clipBehavior: Clip.antiAlias,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 15.0),
                        child: Column(
                          children: [
                            Text(
                              "Bacharel em Sistemas de Informação e desenvolvedor mobile focado em Flutter com interesse em iniciativas de cunho socioambiental.\nAgradecimento especial a meu orientador Luciano Maciel Ribeiro.",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _launchURL(
                                        "http://linkedin.com/in/caiobribeiro");
                                  },
                                  child: const Text('Linkdin'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _launchURL(
                                        "http://github.com/caiobribeiro");
                                  },
                                  child: const Text('Github'),
                                ),
                                ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.bug_report,
                                    size: 24.0,
                                  ),
                                  label: Text('Reportar Bug!'),
                                  onPressed: () {
                                    sendEmail();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
