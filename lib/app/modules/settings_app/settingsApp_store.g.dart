// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settingsApp_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsAppStore on SettingsAppStoreBase, Store {
  final _$savedUserNickNameAtom =
      Atom(name: 'SettingsAppStoreBase.savedUserNickName');

  @override
  String? get savedUserNickName {
    _$savedUserNickNameAtom.reportRead();
    return super.savedUserNickName;
  }

  @override
  set savedUserNickName(String? value) {
    _$savedUserNickNameAtom.reportWrite(value, super.savedUserNickName, () {
      super.savedUserNickName = value;
    });
  }

  final _$getSavedUserInfoAsyncAction =
      AsyncAction('SettingsAppStoreBase.getSavedUserInfo');

  @override
  Future getSavedUserInfo() {
    return _$getSavedUserInfoAsyncAction.run(() => super.getSavedUserInfo());
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
savedUserNickName: ${savedUserNickName}
    ''';
  }
}
