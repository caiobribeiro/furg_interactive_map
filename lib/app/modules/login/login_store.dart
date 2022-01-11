import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final AppStore store = Modular.get<AppStore>();

  _LoginStoreBase() {
    autorun(
      (_) {},
    );
  }

  @observable
  String loginEmail = "";

  @action
  void setLoginEmail(String value) => loginEmail = value;

  @observable
  String loginPassword = "";

  @action
  void setLoginPassword(String value) => loginPassword = value;

  @observable
  String registerEmail = "";

  @action
  void setRegisterEmail(String value) => registerEmail = value;

  @observable
  String registerPassword = "";

  @action
  void setRegisterPassword(String value) => registerPassword = value;

  @observable
  String registerConfirmationPassword = "";

  @action
  void setRegisterConfirmationPassword(String value) =>
      registerConfirmationPassword = value;

  @computed
  bool get isLoginEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(loginEmail);

  @computed
  bool get isLoginPasswordValid => loginPassword.length > 6;

  @computed
  bool get isLoginFormValid => isLoginEmailValid && isLoginPasswordValid;

  @computed
  bool get isRegisterEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(registerEmail);

  @computed
  bool get isRegisterPasswordValid =>
      registerPassword.length > 6 &&
      registerConfirmationPassword == registerPassword;

  @computed
  bool get isResgiterFormValid =>
      isRegisterEmailValid && isRegisterPasswordValid;

  @observable
  String furgImageLogin =
      "https://reinter.furg.br/images/inicial/Carreiros.jpg";
}
