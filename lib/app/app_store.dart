import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'modules/settings_app/color_schema.dart';
part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

class MyTheme {
  // * Creating both themmes
  static final ThemeData light = _buildLightTheme();
  static final ThemeData dark = _buildDarkTheme();

  // * Iniatilizing light theme
  static ThemeData _buildLightTheme() {
    final lightBase = ThemeData(
        colorScheme: lightColorScheme,
        brightness: Brightness.light,
        useMaterial3: true);
    return lightBase;

    //   elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //       backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
    //     ),
    //   ),
  }

  // * Iniatilizing dark theme and changing ElevatedButtonThemeData to fallow the dark theme
  static ThemeData _buildDarkTheme() {
    final darkBase = ThemeData(
        colorScheme: darkColorScheme,
        brightness: Brightness.dark,
        useMaterial3: true);
    return darkBase;
  }
}

abstract class _AppStoreBase with Store {
  // * Before teh render _AppStorebase will run what is inside
  _AppStoreBase() {
    hasUserLogged();
    isLoggedVerification();
    loadTheme();
  }

  // Breakpoints
  var kTabletBreakpoint = 768.0;

  @observable
  bool isRegistered = false;

  @observable
  bool isLogged = false;

  @observable
  String userEmail = "";

  @observable
  String fullName = "";

  @action
  isLoggedVerification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isLogged') == null) {
      isLogged = false;
    } else {
      isLogged = prefs.getBool('isLogged')!;
    }
  }

  @action
  Future<bool> hasUserLogged() async {
    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    if (currentUser == null) {
      return false;
    }
    //Checks whether the user's session token is valid
    final ParseResponse? parseResponse =
        await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);

    if (parseResponse?.success == null || !parseResponse!.success) {
      //Invalid session. Logout
      await currentUser.logout();

      return false;
    } else {
      userEmail = currentUser.emailAddress!;
      isLogged = true;
      print(currentUser.authData);
      return true;
    }
  }

  // * Type of my current theme
  @observable
  ThemeData? themeType;

  // * bool of my current theme
  @computed
  bool get isDark => themeType?.brightness == Brightness.dark;

  // * function taht change themes and save in my local storage
  @action
  changeTheme() {
    if (isDark) {
      themeType = MyTheme.light;
    } else {
      themeType = MyTheme.dark;
    }
    saveThemePreferences();
  }

  // * function that saves my chose theme as True or False
  @action
  saveThemePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
  }

  // * function that fetche my the chose theme on my local sorage
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
