import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: Image.asset('assets/images/furglogo.png'),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            onTap: () {
              Modular.to.navigate('/furgMap');
            },
            title: Text('Mapa'),
            leading: Icon(Icons.map),
          ),
          ListTile(
            onTap: () {
              Modular.to.navigate('/search');
            },
            title: Text('Pesquisar na Universidade'),
            leading: Icon(Icons.search_rounded),
          ),
          ListTile(
            onTap: () {
              Modular.to.navigate('/allBuildings');
            },
            title: Text('Prédios'),
            leading: Icon(Icons.business_rounded),
          ),
          ListTile(
            onTap: () {
              Modular.to.navigate('/allEvents');
            },
            title: Text('Eventos'),
            leading: Icon(Icons.event),
          ),
          ListTile(
            onTap: () {
              Modular.to.navigate('/moreLinks');
            },
            title: Text('Mais Links'),
            leading: Icon(Icons.link_outlined),
          ),
          Divider(
            height: 5,
            thickness: 2,
          ),
          ListTile(
            onTap: () {
              Modular.to.navigate('/settings');
            },
            title: Text('Configurações'),
            leading: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
