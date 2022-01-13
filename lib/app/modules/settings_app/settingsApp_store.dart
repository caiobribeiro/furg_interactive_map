import 'package:furg_interactive_map/app/app_store.dart';
// import 'package:furg_interactive_map/app/modules/fmap/fmap_store.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'settingsApp_store.g.dart';

class SettingsAppStore = SettingsAppStoreBase with _$SettingsAppStore;

abstract class SettingsAppStoreBase with Store {
  // final FmapStore fmapStore;
  final AppStore appStore;
  SettingsAppStoreBase(this.appStore);

  @observable
  String? savedUserNickName = "";

  @action
  getSavedUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    savedUserNickName = prefs.getString('registeredNickName');
  }

  @action
  userLogoutShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove("registeredNickName");
    prefs.remove("isLogged");
  }
}
