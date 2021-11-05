import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Caio'),
            accountEmail: Text('caio@mail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
            ),
          ),
          Center(child: Text("Matérias registradas: 5")),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Modular.to.pushNamed('/fmap');
            },
            title: Text('Mapa'),
            leading: Icon(Icons.map),
          ),
          ListTile(
            onTap: () {
              Modular.to.pushNamed('/building');
            },
            title: Text('Prédios e Eventos'),
            leading: Icon(Icons.search_rounded),
          ),
          ListTile(
            onTap: () {
              Modular.to.pushNamed('/settings');
            },
            title: Text('Configurações'),
            leading: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
