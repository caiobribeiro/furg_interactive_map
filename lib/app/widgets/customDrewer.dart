import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          IconButton(
            onPressed: () {
              Modular.to.pushReplacementNamed('/fmap');
              Modular.to.pop();
            },
            icon: Icon(Icons.shopping_bag),
          ),
          IconButton(
            onPressed: () {
              Modular.to.pushNamed('/settings');
              Modular.to.pop();
            },
            icon: Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              Modular.to.navigate('/');
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
