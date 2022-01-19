import 'package:furg_interactive_map/app/modules/aboutTheProject/aboutTheProject_Page.dart';
import 'package:furg_interactive_map/app/modules/aboutTheProject/aboutTheProject_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AboutTheProjectModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AboutTheProjectStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AboutTheProjectPage()),
  ];
}
