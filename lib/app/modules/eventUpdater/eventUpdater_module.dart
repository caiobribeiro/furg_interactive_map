import 'package:furg_interactive_map/app/modules/eventUpdater/eventUpdater_Page.dart';
import 'package:furg_interactive_map/app/modules/eventUpdater/eventUpdater_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventUpdaterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EventUpdaterStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => EventUpdaterPage()),
  ];
}
