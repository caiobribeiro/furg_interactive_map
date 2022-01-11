// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStoreBase, Store {
  Computed<bool>? _$isDarkComputed;

  @override
  bool get isDark => (_$isDarkComputed ??=
          Computed<bool>(() => super.isDark, name: '_AppStoreBase.isDark'))
      .value;

  final _$isRegisteredAtom = Atom(name: '_AppStoreBase.isRegistered');

  @override
  bool get isRegistered {
    _$isRegisteredAtom.reportRead();
    return super.isRegistered;
  }

  @override
  set isRegistered(bool value) {
    _$isRegisteredAtom.reportWrite(value, super.isRegistered, () {
      super.isRegistered = value;
    });
  }

  final _$isLoggedAtom = Atom(name: '_AppStoreBase.isLogged');

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  final _$themeTypeAtom = Atom(name: '_AppStoreBase.themeType');

  @override
  ThemeData? get themeType {
    _$themeTypeAtom.reportRead();
    return super.themeType;
  }

  @override
  set themeType(ThemeData? value) {
    _$themeTypeAtom.reportWrite(value, super.themeType, () {
      super.themeType = value;
    });
  }

  final _$saveThemePreferencesAsyncAction =
      AsyncAction('_AppStoreBase.saveThemePreferences');

  @override
  Future saveThemePreferences() {
    return _$saveThemePreferencesAsyncAction
        .run(() => super.saveThemePreferences());
  }

  final _$loadThemeAsyncAction = AsyncAction('_AppStoreBase.loadTheme');

  @override
  Future<dynamic> loadTheme() {
    return _$loadThemeAsyncAction.run(() => super.loadTheme());
  }

  final _$_AppStoreBaseActionController =
      ActionController(name: '_AppStoreBase');

  @override
  dynamic changeTheme() {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isRegistered: ${isRegistered},
isLogged: ${isLogged},
themeType: ${themeType},
isDark: ${isDark}
    ''';
  }
}
