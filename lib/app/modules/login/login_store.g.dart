// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool>? _$isLoginEmailValidComputed;

  @override
  bool get isLoginEmailValid => (_$isLoginEmailValidComputed ??= Computed<bool>(
          () => super.isLoginEmailValid,
          name: '_LoginStoreBase.isLoginEmailValid'))
      .value;
  Computed<bool>? _$isLoginPasswordValidComputed;

  @override
  bool get isLoginPasswordValid => (_$isLoginPasswordValidComputed ??=
          Computed<bool>(() => super.isLoginPasswordValid,
              name: '_LoginStoreBase.isLoginPasswordValid'))
      .value;
  Computed<bool>? _$isLoginFormValidComputed;

  @override
  bool get isLoginFormValid => (_$isLoginFormValidComputed ??= Computed<bool>(
          () => super.isLoginFormValid,
          name: '_LoginStoreBase.isLoginFormValid'))
      .value;

  final _$errorMassegeAtom = Atom(name: '_LoginStoreBase.errorMassege');

  @override
  String get errorMassege {
    _$errorMassegeAtom.reportRead();
    return super.errorMassege;
  }

  @override
  set errorMassege(String value) {
    _$errorMassegeAtom.reportWrite(value, super.errorMassege, () {
      super.errorMassege = value;
    });
  }

  final _$loginNickNameAtom = Atom(name: '_LoginStoreBase.loginNickName');

  @override
  String get loginNickName {
    _$loginNickNameAtom.reportRead();
    return super.loginNickName;
  }

  @override
  set loginNickName(String value) {
    _$loginNickNameAtom.reportWrite(value, super.loginNickName, () {
      super.loginNickName = value;
    });
  }

  final _$loginPasswordAtom = Atom(name: '_LoginStoreBase.loginPassword');

  @override
  String get loginPassword {
    _$loginPasswordAtom.reportRead();
    return super.loginPassword;
  }

  @override
  set loginPassword(String value) {
    _$loginPasswordAtom.reportWrite(value, super.loginPassword, () {
      super.loginPassword = value;
    });
  }

  final _$furgImageLoginAtom = Atom(name: '_LoginStoreBase.furgImageLogin');

  @override
  String get furgImageLogin {
    _$furgImageLoginAtom.reportRead();
    return super.furgImageLogin;
  }

  @override
  set furgImageLogin(String value) {
    _$furgImageLoginAtom.reportWrite(value, super.furgImageLogin, () {
      super.furgImageLogin = value;
    });
  }

  final _$saveUserAsyncAction = AsyncAction('_LoginStoreBase.saveUser');

  @override
  Future saveUser() {
    return _$saveUserAsyncAction.run(() => super.saveUser());
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void setLoginNickName(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setLoginNickName');
    try {
      return super.setLoginNickName(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoginPassword(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setLoginPassword');
    try {
      return super.setLoginPassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMassege: ${errorMassege},
loginNickName: ${loginNickName},
loginPassword: ${loginPassword},
furgImageLogin: ${furgImageLogin},
isLoginEmailValid: ${isLoginEmailValid},
isLoginPasswordValid: ${isLoginPasswordValid},
isLoginFormValid: ${isLoginFormValid}
    ''';
  }
}
