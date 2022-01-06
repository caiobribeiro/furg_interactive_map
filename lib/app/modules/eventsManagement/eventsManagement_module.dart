import 'package:furg_interactive_map/app/modules/eventsManagement/eventsManagement_Page.dart';
import 'package:furg_interactive_map/app/modules/eventsManagement/eventsManagement_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventsManagementModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EventsManagementStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => EventsManagementPage()),
  ];
}
