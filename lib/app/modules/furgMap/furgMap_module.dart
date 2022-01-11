import 'package:furg_interactive_map/app/modules/furgMap/furgMap_Page.dart';
import 'package:furg_interactive_map/app/modules/furgMap/furgMap_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FurgMapModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FurgMapStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => FurgMapPage()),
  ];
}
