import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        actions: [
          Observer(builder: (_) {
            return Switch(
              value: store.appStore.isDark,
              onChanged: (value) {
                setState(() {
                  store.appStore.changeTheme();
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            );
          })
        ],
      ),
      body: Row(
        children: [
          Observer(
            builder: (context) => Text('${store.counter}'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/auth');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
