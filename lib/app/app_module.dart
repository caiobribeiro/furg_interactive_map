import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/auth/auth_module.dart';
import 'package:furg_interactive_map/app/modules/auth/auth_page.dart';
import 'package:furg_interactive_map/app/modules/fmap/fmap_module.dart';
import 'package:furg_interactive_map/app/modules/start/start_page.dart';
import 'app_store.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AppStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute(
    //   '/start',
    //   child: (context, args) => StartPage(),
    //   children: [ChildRoute('/auth', child: (_, __) => AuthPage())],
    // ),
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/fmap', module: FmapModule()),
  ];
}
