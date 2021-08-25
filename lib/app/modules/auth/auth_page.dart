import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/auth/auth_store.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => Modular.to.pushNamed('/fmap'),
                child: Text("Visitante"),
              ),
              ElevatedButton(
                onPressed: () => Modular.to.pushNamed('/home'),
                child: Text("Login"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
