import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/app_store.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  final AppStore _appStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _appStore.isDark
              ? Container(
                  padding: EdgeInsets.all(20),
                  child: Image.asset('assets/images/furglogo.png'),
                )
              : Container(
                  padding: EdgeInsets.all(20),
                  child: Image.asset('assets/images/furglogo-fontepreta.png'),
                ),
          Divider(
            height: 5,
            thickness: 2,
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
          // ListTile(
          //   onTap: () {
          //     Modular.to.navigate('/moreLinks');
          //   },
          //   title: Text('Mais Links'),
          //   leading: Icon(Icons.link_outlined),
          // ),
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
