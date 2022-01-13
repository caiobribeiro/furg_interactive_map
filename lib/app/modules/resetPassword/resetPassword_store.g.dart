// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resetPassword_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResetPasswordStore on _ResetPasswordStoreBase, Store {
  Computed<bool>? _$isRecoverFormValidComputed;

  @override
  bool get isRecoverFormValid => (_$isRecoverFormValidComputed ??=
          Computed<bool>(() => super.isRecoverFormValid,
              name: '_ResetPasswordStoreBase.isRecoverFormValid'))
      .value;

  final _$recoverEmailAtom = Atom(name: '_ResetPasswordStoreBase.recoverEmail');

  @override
  String get recoverEmail {
    _$recoverEmailAtom.reportRead();
    return super.recoverEmail;
  }

  @override
  set recoverEmail(String value) {
    _$recoverEmailAtom.reportWrite(value, super.recoverEmail, () {
      super.recoverEmail = value;
    });
  }

  final _$_ResetPasswordStoreBaseActionController =
      ActionController(name: '_ResetPasswordStoreBase');

  @override
  void setrecoverEmail(String value) {
    final _$actionInfo = _$_ResetPasswordStoreBaseActionController.startAction(
        name: '_ResetPasswordStoreBase.setrecoverEmail');
    try {
      return super.setrecoverEmail(value);
    } finally {
      _$_ResetPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recoverEmail: ${recoverEmail},
isRecoverFormValid: ${isRecoverFormValid}
    ''';
  }
}
