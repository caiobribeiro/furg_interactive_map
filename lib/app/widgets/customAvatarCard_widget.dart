import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAvatarCard extends StatelessWidget {
  const CustomAvatarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return Stack(
      children: <Widget>[
        Card(
          margin: const EdgeInsets.all(20),
          child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 17.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Sobre o Mapa Interativo FURG",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                        child: Text(
                          "O objetivo do projeto é possibilitar ampliar a experiência da comunidade acadêmica, contribuir para o sentido de pertencimento dos diferentes atores, permitir uma melhor experiência para os visitantes, tanto em eventos quanto em atividades rotineiras na Universidade.\nO projeto tem seu código aberto e disponível no GitHub.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Divider(),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          "Sobre o Desenvolvedor",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/caio.jpg'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Caio Beraldi Ribeiro",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Bacharel em Sistemas de Informação e esenvolvedor mobile focado em Flutter com interesse em iniciativas de cunho socioambiental.\nAgradecimento especial a meu orientador Luciano Maciel Ribeiro.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _launchURL("http://linkedin.com/in/caiobribeiro");
                            },
                            child: const Text('Linkdin'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _launchURL("http://github.com/caio4719");
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
              )),
        ),
      ],
    );
  }
}
