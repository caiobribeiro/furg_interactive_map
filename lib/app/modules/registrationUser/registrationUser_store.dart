import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'registrationUser_store.g.dart';

class RegistrationUserStore = _RegistrationUserStoreBase
    with _$RegistrationUserStore;

abstract class _RegistrationUserStoreBase with Store {
  @observable
  String registerNickName = "";

  @action
  void setRegisterNickName(String value) => registerNickName = value;

  @observable
  String registerFirstName = "";

  @action
  void setRegisterFirstName(String value) => registerFirstName = value;

  @observable
  String registerLastName = "";

  @action
  void setRegisterLastName(String value) => registerLastName = value;

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

  @action
  saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('registeredNickName', registerNickName);
    prefs.setBool('isLogged', true);
  }
}
