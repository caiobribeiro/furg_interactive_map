import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/customDrewer.dart';

import '../../app_store.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthStore store = Modular.get();
  final AppStore _appStore = Modular.get();

  bool showcase = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: DrawerCustom(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _appStore.isDark == true
                  ? Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      width: 200,
                      child: Image.asset(
                          "assets/images/logo-furg-sem-fundo-branco.png"),
                    )
                  : Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      width: 200,
                      child:
                          Image.asset("assets/images/logo-furg-sem-fundo.png"),
                    ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => Modular.to.pushNamed('/fmap'),
                    child: Text("Mapa e Eventos da Universidade"),
                  ),
                  ElevatedButton(
                    onPressed: () => Modular.to.navigate('/login'),
                    child: Text("Login Administração"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
