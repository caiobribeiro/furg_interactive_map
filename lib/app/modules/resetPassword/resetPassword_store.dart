import 'package:mobx/mobx.dart';

part 'resetPassword_store.g.dart';

class ResetPasswordStore = _ResetPasswordStoreBase with _$ResetPasswordStore;

abstract class _ResetPasswordStoreBase with Store {
  @observable
  String recoverEmail = "";

  @action
  void setrecoverEmail(String value) => recoverEmail = value;

  @computed
  bool get isRecoverFormValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(recoverEmail);
}
