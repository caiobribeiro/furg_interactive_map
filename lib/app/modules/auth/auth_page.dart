import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/customDrewer.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthStore store = Modular.get();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Qual Visualização prefere?"),
              Switch(
                value: showcase,
                onChanged: (value) {
                  setState(
                    () {
                      // store.appStore.loadTheme();
                      // store.changeTheme();
                      showcase = !showcase;
                    },
                  );
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
              Visibility(
                visible: showcase,
                child: Text("Polígnos"),
              ),
              Visibility(
                visible: !showcase,
                child: Text("Marcadores"),
              ),
              ElevatedButton(
                onPressed: () => Modular.to.pushNamed('/fmap'),
                child: Text("Visitante"),
              ),
              ElevatedButton(
                onPressed: () => Modular.to.pushNamed('/settings'),
                child: Text("Login"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
