// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:furg_interactive_map/app/app_store.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  // final AppStore _appStore = Modular.get();

  _LoginStoreBase() {
    autorun(
      (_) {},
    );
  }

  @observable
  String errorMassege = "";

  @observable
  String loginNickName = "";

  @action
  void setLoginNickName(String value) => loginNickName = value;

  @observable
  String loginPassword = "";

  @action
  void setLoginPassword(String value) => loginPassword = value;

  @computed
  bool get isLoginEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(loginNickName);

  @computed
  bool get isLoginPasswordValid => loginPassword.length > 6;

  @computed
  bool get isLoginFormValid => isLoginEmailValid && isLoginPasswordValid;

  @observable
  String furgImageLogin =
      "https://reinter.furg.br/images/inicial/Carreiros.jpg";

  @action
  saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('registeredNickName', loginNickName);
    prefs.setBool('isLogged', true);
  }
}
