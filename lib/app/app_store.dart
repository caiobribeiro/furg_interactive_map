import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  @observable
  ThemeData themeType = ThemeData.light();

  @computed
  bool get isDark => themeType.brightness == Brightness.dark;

  @action
  changeTheme() {
    if (isDark) {
      themeType = ThemeData.light();
    } else {
      themeType = ThemeData.dark();
    }
  }
}
