import 'package:furg_interactive_map/app/modules/allEvents/allEvents_Page.dart';
import 'package:furg_interactive_map/app/modules/allEvents/allEvents_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AllEventsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AllEventsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AllEventsPage()),
  ];
}
