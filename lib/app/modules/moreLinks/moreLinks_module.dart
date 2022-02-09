import 'package:furg_interactive_map/app/modules/moreLinks/moreLinks_Page.dart';
import 'package:furg_interactive_map/app/modules/moreLinks/moreLinks_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoreLinksModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MoreLinksStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MoreLinksPage()),
  ];
}
