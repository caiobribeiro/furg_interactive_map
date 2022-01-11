import 'package:furg_interactive_map/app/modules/furg_phone_list_search/furgPhoneListSearch_Page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'furgPhoneListSearch_store.dart';

class FurgPhoneListSearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FurgPhoneListSearchStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute('/', child: (_, args) => FurgPhoneListSearchPage()),
    ChildRoute('/:buildingSearch',
        child: (_, args) => FurgPhoneListSearchPage(
            buildingSearch: args.params['buildingSearch'] ?? "")),
  ];
}
