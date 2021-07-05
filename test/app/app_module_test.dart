import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furg_interactive_map/app/app_module.dart';
import 'package:furg_interactive_map/app/modules/auth/auth_module.dart';

void main() {
  initModules([AppModule(), AuthModule()]);

  test("Get Controller", () {
    final controller = Modular.get<Controller>();
    controller.prinText();
  });
}
