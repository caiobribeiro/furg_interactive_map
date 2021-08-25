import 'package:furg_interactive_map/app/modules/fmap/fmap_page.dart';
import 'package:furg_interactive_map/app/modules/fmap/fmap_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'fmap_page.dart';

class FmapModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FmapStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => FmapPage()),
  ];
}
