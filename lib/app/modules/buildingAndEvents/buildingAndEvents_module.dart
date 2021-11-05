import 'package:furg_interactive_map/app/modules/buildingAndEvents/buildingAndEvents_Page.dart';
import 'package:furg_interactive_map/app/modules/buildingAndEvents/buildingAndEvents_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BuildingAndEventsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BuildingAndEventsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => BuildingAndEventsPage()),
  ];
}
