import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/settings_app/settingsApp_store.dart';
import 'package:furg_interactive_map/app/widgets/customDrewer.dart';

class SettingsAppPage extends StatefulWidget {
  @override
  _SettingsAppPageState createState() => _SettingsAppPageState();
}

class _SettingsAppPageState
    extends ModularState<SettingsAppPage, SettingsAppStore> {
  final appBar = AppBar(
    title: Text('Carreiros'),
    centerTitle: true,
    actions: [],
  );
  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final appBarHeight = appBar.preferredSize.height;
    // final statusBarHeight = MediaQuery.of(context).padding.top;
    // final deviceHeight = screenHeight - appBarHeight - statusBarHeight;

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        actions: [
          Observer(
            builder: (_) {
              return Switch(
                value: store.appStore.isDark,
                onChanged: (value) {
                  setState(() {
                    // store.appStore.loadTheme();
                    store.appStore.changeTheme();
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              );
            },
          ),
        ],
      ),
      drawer: DrawerCustom(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
            ],
          ),
        ],
      ),
    );
  }
}
