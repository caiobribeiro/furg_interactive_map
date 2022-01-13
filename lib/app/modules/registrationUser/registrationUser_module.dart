import 'package:furg_interactive_map/app/modules/registrationUser/registrationUser_Page.dart';
import 'package:furg_interactive_map/app/modules/registrationUser/registrationUser_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationUserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegistrationUserStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RegistrationUserPage()),
  ];
}
