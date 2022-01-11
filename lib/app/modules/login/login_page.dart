import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:furg_interactive_map/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  final AppStore _appStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: Text(_appStore.isRegistered ? "Login" : "Registrar-se"),
    );
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    // final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = screenHeight - appBarHeight - statusBarHeight;

    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/login-background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              width: screenWidth,
              height: deviceHeight,
              child: Container()
              // BlurHash(hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I"),
              ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: _appStore.isRegistered ? Login() : CreateAccount(),
          ),
        ],
      ),
    );
  }
}

class Login extends StatelessWidget {
  final LoginStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white30,
              border: OutlineInputBorder(),
              hintText: 'Email Furg',
            ),
            onChanged: store.setLoginEmail,
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
        Observer(builder: (_) {
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
              onPressed: () => store.isLoginFormValid
                  ? Modular.to.pushNamed('/furgMap')
                  : null,
            ),
          );
        }),
      ],
    );
  }
}

class CreateAccount extends StatelessWidget {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white30,
              border: OutlineInputBorder(),
              hintText: 'Email Furg',
            ),
            onChanged: store.setRegisterEmail,
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
            onChanged: store.setRegisterPassword,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white30,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0),
              ),
              hintText: 'Confirmar Senha',
            ),
            onChanged: store.setRegisterConfirmationPassword,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: ElevatedButton.icon(
            icon: Icon(
              Icons.person_add,
              size: 24.0,
            ),
            label: Text('Criar Conta'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(330, 50),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () => store.isResgiterFormValid
                ? Modular.to.pushNamed('/furgMap')
                : null,
          ),
        ),
      ],
    );
  }
}
