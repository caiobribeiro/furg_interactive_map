import 'package:furg_interactive_map/app/app_store.dart';
import 'package:mobx/mobx.dart';
part 'settingsApp_store.g.dart';

class SettingsAppStore = SettingsAppStoreBase with _$SettingsAppStore;

abstract class SettingsAppStoreBase with Store {
  final AppStore appStore;
  SettingsAppStoreBase(this.appStore);
}
