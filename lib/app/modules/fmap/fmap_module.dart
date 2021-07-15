import 'package:furg_interactive_map/app/modules/fmap/fmap_page.dart';
import 'package:furg_interactive_map/app/modules/fmap/fmap_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FmapModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FmapStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => FmapPage()),
  ];
}
