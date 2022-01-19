import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/aboutTheProject/aboutTheProject_module.dart';
import 'package:furg_interactive_map/app/modules/allBuildings/allBuildings_module.dart';
import 'package:furg_interactive_map/app/modules/auth/auth_module.dart';
// import 'package:furg_interactive_map/app/modules/fmap/fmap_module.dart';
import 'package:furg_interactive_map/app/modules/login/login_module.dart';
import 'package:furg_interactive_map/app/modules/registrationUser/registrationUser_module.dart';
import 'package:furg_interactive_map/app/modules/resetPassword/resetPassword_module.dart';
import 'package:furg_interactive_map/app/modules/settings_app/settingsApp_module.dart';
import 'modules/allEvents/allEvents_module.dart';
import 'modules/eventsManagement/eventsManagement_module.dart';
import 'modules/furgMap/furgMap_module.dart';
import 'modules/furg_phone_list_search/furgPhoneListSearch_module.dart';
import 'app_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AppStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    // ModuleRoute('/fmap', module: FmapModule()),
    ModuleRoute('/settings', module: SettingsAppModule()),
    ModuleRoute('/allBuildings', module: AllBuildingsModule()),
    ModuleRoute('/search', module: FurgPhoneListSearchModule()),
    ModuleRoute('/eventsManagament', module: EventsManagementModule()),
    ModuleRoute('/allEvents', module: AllEventsModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/furgMap', module: FurgMapModule()),
    ModuleRoute('/registrationUser', module: RegistrationUserModule()),
    ModuleRoute('/resetPassword', module: ResetPasswordModule()),
    ModuleRoute('/aboutTheProject', module: AboutTheProjectModule()),
  ];
}
