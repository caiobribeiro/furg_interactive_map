import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/auth/auth_module.dart';
import 'package:furg_interactive_map/app/modules/fmap/fmap_module.dart';
import 'package:furg_interactive_map/app/modules/settings_app/settingsApp_module.dart';
// import 'package:furg_interactive_map/app/modules/fmap/fmap_module.dart';
import 'app_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AppStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute('/fmap', module: FmapModule()),
    ModuleRoute('/settings', module: SettingsAppModule()),
  ];
}
