import 'package:furg_interactive_map/app/modules/allBuildings/allBuildings_Page.dart';
import 'package:furg_interactive_map/app/modules/allBuildings/allBuildings_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AllBuildingsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AllBuildingsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AllBuildingsPage()),
  ];
}
