import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  doUserLogin() async {
    final user = ParseUser(store.loginNickName, store.loginPassword, null);

    var response = await user.login();

    if (response.success) {
      showSuccess("Login Sucesso!");
    } else {
      showError(response.error!.message);
    }
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sucesso!"),
          content: Text(message),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                store.saveUser();
                Navigator.of(context).pop();
                Modular.to.navigate('/furgMap');
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: Text("Login"),
    );
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    // final appBarHeight = appBar.preferredSize.height;
    // final statusBarHeight = MediaQuery.of(context).padding.top;
    // final deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = screenHeight - appBarHeight - statusBarHeight;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(30, 80, 30, 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(),
                    hintText: 'Email Furg',
                  ),
                  onChanged: store.setLoginNickName,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(),
                    hintText: 'Senha',
                  ),
                  onChanged: store.setLoginPassword,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                    child: TextButton(
                      onPressed: () {
                        Modular.to.pushNamed('/resetPassword');
                      },
                      child: Text(
                        "Esqueceu a senha?",
                        // style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Observer(
                builder: (_) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.login_rounded,
                        size: 24.0,
                      ),
                      label: Text('Entrar'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(330, 50),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () => doUserLogin(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
