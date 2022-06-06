import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:furg_interactive_map/app/modules/auth/auth_store.dart';
import 'package:flutter/material.dart';
// import 'package:furg_interactive_map/app/widgets/customDrewer.dart';

// import '../../app_store.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthStore store = Modular.get();
  final AppStore _appStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: Text("Início"),
    );
    final screenWidth = MediaQuery.of(context).size.width;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      body: _appStore.kTabletBreakpoint >= MediaQuery.of(context).size.width
          ? SingleChildScrollView(
              child: Row(
                children: [
                  Container(
                    width: screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Observer(builder: (_) {
                          return _appStore.isDark
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 40),
                                  width:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Image.asset(
                                      "assets/images/logo-furg-sem-fundo-branco.png"),
                                )
                              : Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 40),
                                  width:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Image.asset(
                                      "assets/images/logo-furg-sem-fundo.png"),
                                );
                        }),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.map_outlined,
                              size: 24.0,
                            ),
                            label: Text('Mapa'),
                            onPressed: () => Modular.to.navigate('/furgMap'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(deviceWidth * 0.65, 45),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.login_rounded,
                              size: 24.0,
                            ),
                            label: Text('Entrar'),
                            onPressed: () {
                              Modular.to.pushNamed('/login');
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(deviceWidth * 0.65, 45),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.person_add_outlined,
                              size: 24.0,
                            ),
                            label: Text('Registrar'),
                            onPressed: () {
                              Modular.to.pushNamed('/registrationUser');
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(deviceWidth * 0.65, 45),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 70),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.info_outline_rounded,
                              size: 24.0,
                            ),
                            label: Text('Sobre o Projeto'),
                            onPressed: () {
                              Modular.to.pushNamed('/aboutTheProject');
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(deviceWidth * 0.65, 45),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Observer(builder: (_) {
                              return _appStore.isDark
                                  ? Container(
                                      margin: EdgeInsets.fromLTRB(0, 30, 0, 40),
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      child: Image.asset(
                                          "assets/images/logo-furg-sem-fundo-branco.png"),
                                    )
                                  : Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      child: Image.asset(
                                          "assets/images/logo-furg-sem-fundo.png"),
                                    );
                            }),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.map_outlined,
                                    size: 24.0,
                                  ),
                                  label: Text('Mapa'),
                                  onPressed: () =>
                                      Modular.to.navigate('/furgMap'),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(deviceWidth * 0.3, 45),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.login_rounded,
                                    size: 24.0,
                                  ),
                                  label: Text('Entrar'),
                                  onPressed: () {
                                    Modular.to.pushNamed('/login');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(deviceWidth * 0.3, 45),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.person_add_outlined,
                                    size: 24.0,
                                  ),
                                  label: Text('Registrar'),
                                  onPressed: () {
                                    Modular.to.pushNamed('/registrationUser');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(deviceWidth * 0.3, 45),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 70),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.info_outline_rounded,
                                    size: 24.0,
                                  ),
                                  label: Text('Sobre o Projeto'),
                                  onPressed: () {
                                    Modular.to.pushNamed('/aboutTheProject');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(deviceWidth * 0.3, 45),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
