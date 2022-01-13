import 'package:furg_interactive_map/app/modules/resetPassword/resetPassword_Page.dart';
import 'package:furg_interactive_map/app/modules/resetPassword/resetPassword_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResetPasswordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ResetPasswordStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ResetPasswordPage()),
  ];
}
