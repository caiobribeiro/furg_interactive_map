import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'settingsApp_store.dart';

import 'settingsApp_page.dart';

class SettingsAppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SettingsAppStore(i.get<AppStore>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SettingsAppPage()),
  ];
}
