// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registrationUser_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegistrationUserStore on _RegistrationUserStoreBase, Store {
  Computed<bool>? _$isRegisterEmailValidComputed;

  @override
  bool get isRegisterEmailValid => (_$isRegisterEmailValidComputed ??=
          Computed<bool>(() => super.isRegisterEmailValid,
              name: '_RegistrationUserStoreBase.isRegisterEmailValid'))
      .value;
  Computed<bool>? _$isRegisterPasswordValidComputed;

  @override
  bool get isRegisterPasswordValid => (_$isRegisterPasswordValidComputed ??=
          Computed<bool>(() => super.isRegisterPasswordValid,
              name: '_RegistrationUserStoreBase.isRegisterPasswordValid'))
      .value;
  Computed<bool>? _$isResgiterFormValidComputed;

  @override
  bool get isResgiterFormValid => (_$isResgiterFormValidComputed ??=
          Computed<bool>(() => super.isResgiterFormValid,
              name: '_RegistrationUserStoreBase.isResgiterFormValid'))
      .value;

  final _$registerNickNameAtom =
      Atom(name: '_RegistrationUserStoreBase.registerNickName');

  @override
  String get registerNickName {
    _$registerNickNameAtom.reportRead();
    return super.registerNickName;
  }

  @override
  set registerNickName(String value) {
    _$registerNickNameAtom.reportWrite(value, super.registerNickName, () {
      super.registerNickName = value;
    });
  }

  final _$registerFirstNameAtom =
      Atom(name: '_RegistrationUserStoreBase.registerFirstName');

  @override
  String get registerFirstName {
    _$registerFirstNameAtom.reportRead();
    return super.registerFirstName;
  }

  @override
  set registerFirstName(String value) {
    _$registerFirstNameAtom.reportWrite(value, super.registerFirstName, () {
      super.registerFirstName = value;
    });
  }

  final _$registerLastNameAtom =
      Atom(name: '_RegistrationUserStoreBase.registerLastName');

  @override
  String get registerLastName {
    _$registerLastNameAtom.reportRead();
    return super.registerLastName;
  }

  @override
  set registerLastName(String value) {
    _$registerLastNameAtom.reportWrite(value, super.registerLastName, () {
      super.registerLastName = value;
    });
  }

  final _$registerEmailAtom =
      Atom(name: '_RegistrationUserStoreBase.registerEmail');

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

  final _$registerPasswordAtom =
      Atom(name: '_RegistrationUserStoreBase.registerPassword');

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
      Atom(name: '_RegistrationUserStoreBase.registerConfirmationPassword');

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

  final _$saveUserAsyncAction =
      AsyncAction('_RegistrationUserStoreBase.saveUser');

  @override
  Future saveUser() {
    return _$saveUserAsyncAction.run(() => super.saveUser());
  }

  final _$_RegistrationUserStoreBaseActionController =
      ActionController(name: '_RegistrationUserStoreBase');

  @override
  void setRegisterNickName(String value) {
    final _$actionInfo = _$_RegistrationUserStoreBaseActionController
        .startAction(name: '_RegistrationUserStoreBase.setRegisterNickName');
    try {
      return super.setRegisterNickName(value);
    } finally {
      _$_RegistrationUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterFirstName(String value) {
    final _$actionInfo = _$_RegistrationUserStoreBaseActionController
        .startAction(name: '_RegistrationUserStoreBase.setRegisterFirstName');
    try {
      return super.setRegisterFirstName(value);
    } finally {
      _$_RegistrationUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterLastName(String value) {
    final _$actionInfo = _$_RegistrationUserStoreBaseActionController
        .startAction(name: '_RegistrationUserStoreBase.setRegisterLastName');
    try {
      return super.setRegisterLastName(value);
    } finally {
      _$_RegistrationUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterEmail(String value) {
    final _$actionInfo = _$_RegistrationUserStoreBaseActionController
        .startAction(name: '_RegistrationUserStoreBase.setRegisterEmail');
    try {
      return super.setRegisterEmail(value);
    } finally {
      _$_RegistrationUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterPassword(String value) {
    final _$actionInfo = _$_RegistrationUserStoreBaseActionController
        .startAction(name: '_RegistrationUserStoreBase.setRegisterPassword');
    try {
      return super.setRegisterPassword(value);
    } finally {
      _$_RegistrationUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterConfirmationPassword(String value) {
    final _$actionInfo =
        _$_RegistrationUserStoreBaseActionController.startAction(
            name: '_RegistrationUserStoreBase.setRegisterConfirmationPassword');
    try {
      return super.setRegisterConfirmationPassword(value);
    } finally {
      _$_RegistrationUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
registerNickName: ${registerNickName},
registerFirstName: ${registerFirstName},
registerLastName: ${registerLastName},
registerEmail: ${registerEmail},
registerPassword: ${registerPassword},
registerConfirmationPassword: ${registerConfirmationPassword},
isRegisterEmailValid: ${isRegisterEmailValid},
isRegisterPasswordValid: ${isRegisterPasswordValid},
isResgiterFormValid: ${isResgiterFormValid}
    ''';
  }
}
