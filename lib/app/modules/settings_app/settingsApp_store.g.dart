// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settingsApp_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsAppStore on SettingsAppStoreBase, Store {
  final _$userLoggedNickeNameAtom =
      Atom(name: 'SettingsAppStoreBase.userLoggedNickeName');

  @override
  String? get userLoggedNickeName {
    _$userLoggedNickeNameAtom.reportRead();
    return super.userLoggedNickeName;
  }

  @override
  set userLoggedNickeName(String? value) {
    _$userLoggedNickeNameAtom.reportWrite(value, super.userLoggedNickeName, () {
      super.userLoggedNickeName = value;
    });
  }

  final _$isLoggedAtom = Atom(name: 'SettingsAppStoreBase.isLogged');

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

  final _$userLogoutSharedAsyncAction =
      AsyncAction('SettingsAppStoreBase.userLogoutShared');

  @override
  Future userLogoutShared() {
    return _$userLogoutSharedAsyncAction.run(() => super.userLogoutShared());
  }

  @override
  String toString() {
    return '''
userLoggedNickeName: ${userLoggedNickeName},
isLogged: ${isLogged}
    ''';
  }
}
