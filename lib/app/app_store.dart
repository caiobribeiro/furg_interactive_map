import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

class MyTheme {
  static final ThemeData light = _buildLightTheme();
  static final ThemeData dark = _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    final base = ThemeData.light();
    return base;
  }

  static ThemeData _buildDarkTheme() {
    final base = ThemeData.dark();
    return base.copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
      ),
    );
  }
}

abstract class _AppStoreBase with Store {
  _AppStoreBase() {
    loadTheme();
  }

  @observable
  ThemeData? themeType;

  @computed
  bool get isDark => themeType?.brightness == Brightness.dark;

  @action
  changeTheme() {
    if (isDark) {
      themeType = MyTheme.light;
    } else {
      themeType = MyTheme.dark;
    }
    saveThemePreferences();
  }

  @action
  saveThemePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
  }

  @action
  Future loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    // await Future.delayed(Duration(seconds: 3));
    final isDark = prefs.getBool('isDark') ?? false;
    if (prefs.containsKey('isDark') && isDark) {
      themeType = MyTheme.dark;
    } else {
      themeType = MyTheme.light;
    }
  }
}
