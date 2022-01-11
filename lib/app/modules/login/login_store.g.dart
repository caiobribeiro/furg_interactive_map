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
  Computed<bool>? _$isRegisterEmailValidComputed;

  @override
  bool get isRegisterEmailValid => (_$isRegisterEmailValidComputed ??=
          Computed<bool>(() => super.isRegisterEmailValid,
              name: '_LoginStoreBase.isRegisterEmailValid'))
      .value;
  Computed<bool>? _$isRegisterPasswordValidComputed;

  @override
  bool get isRegisterPasswordValid => (_$isRegisterPasswordValidComputed ??=
          Computed<bool>(() => super.isRegisterPasswordValid,
              name: '_LoginStoreBase.isRegisterPasswordValid'))
      .value;
  Computed<bool>? _$isResgiterFormValidComputed;

  @override
  bool get isResgiterFormValid => (_$isResgiterFormValidComputed ??=
          Computed<bool>(() => super.isResgiterFormValid,
              name: '_LoginStoreBase.isResgiterFormValid'))
      .value;

  final _$loginEmailAtom = Atom(name: '_LoginStoreBase.loginEmail');

  @override
  String get loginEmail {
    _$loginEmailAtom.reportRead();
    return super.loginEmail;
  }

  @override
  set loginEmail(String value) {
    _$loginEmailAtom.reportWrite(value, super.loginEmail, () {
      super.loginEmail = value;
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

  final _$registerEmailAtom = Atom(name: '_LoginStoreBase.registerEmail');

  @override
  String get registerEmail {
    _$registerEmailAtom.reportRead();
    return super.registerEmail;
  }

  @override
  set registerEmail(String value) {
    _$registerEmailAtom.reportWrite(value, super.registerEmail, () {
      super.registerEmail = value;
    });
  }

  final _$registerPasswordAtom = Atom(name: '_LoginStoreBase.registerPassword');

  @override
  String get registerPassword {
    _$registerPasswordAtom.reportRead();
    return super.registerPassword;
  }

  @override
  set registerPassword(String value) {
    _$registerPasswordAtom.reportWrite(value, super.registerPassword, () {
      super.registerPassword = value;
    });
  }

  final _$registerConfirmationPasswordAtom =
      Atom(name: '_LoginStoreBase.registerConfirmationPassword');

  @override
  String get registerConfirmationPassword {
    _$registerConfirmationPasswordAtom.reportRead();
    return super.registerConfirmationPassword;
  }

  @override
  set registerConfirmationPassword(String value) {
    _$registerConfirmationPasswordAtom
        .reportWrite(value, super.registerConfirmationPassword, () {
      super.registerConfirmationPassword = value;
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

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void setLoginEmail(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setLoginEmail');
    try {
      return super.setLoginEmail(value);
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
  void setRegisterEmail(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setRegisterEmail');
    try {
      return super.setRegisterEmail(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterPassword(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setRegisterPassword');
    try {
      return super.setRegisterPassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterConfirmationPassword(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setRegisterConfirmationPassword');
    try {
      return super.setRegisterConfirmationPassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loginEmail: ${loginEmail},
loginPassword: ${loginPassword},
registerEmail: ${registerEmail},
registerPassword: ${registerPassword},
registerConfirmationPassword: ${registerConfirmationPassword},
furgImageLogin: ${furgImageLogin},
isLoginEmailValid: ${isLoginEmailValid},
isLoginPasswordValid: ${isLoginPasswordValid},
isLoginFormValid: ${isLoginFormValid},
isRegisterEmailValid: ${isRegisterEmailValid},
isRegisterPasswordValid: ${isRegisterPasswordValid},
isResgiterFormValid: ${isResgiterFormValid}
    ''';
  }
}
