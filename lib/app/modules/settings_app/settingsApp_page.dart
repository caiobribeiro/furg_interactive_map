import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/settings_app/settingsApp_store.dart';
import 'package:furg_interactive_map/app/widgets/customDrawer.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class SettingsAppPage extends StatefulWidget {
  @override
  _SettingsAppPageState createState() => _SettingsAppPageState();
}

class _SettingsAppPageState
    extends ModularState<SettingsAppPage, SettingsAppStore> {
  final appBar = AppBar(
    title: Text('Carreiros'),
    centerTitle: true,
    actions: [],
  );

  @override
  void initState() {
    isUserLogged();
    super.initState();
  }

  Future isUserLogged() async {
    final currentUser = await ParseUser.currentUser() as ParseUser?;
    if (currentUser?.emailVerified == null) {
      store.isLogged = false;
    } else {
      store.isLogged = currentUser!.emailVerified!;
      store.userLoggedNickeName = currentUser.username!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    void showError(String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Erro"),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void doUserLogout() async {
      final user = await ParseUser.currentUser() as ParseUser;
      var response = await user.logout();

      if (response.success) {
        store.userLogoutShared();
        Modular.to.navigate('/furgMap');
      } else {
        showError(response.error!.message);
      }
    }

    void areYouSure() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Certeza?"),
            content: Text(
                "Quando não conectado(a) os recursos de Eventos estarão indisponíveis"),
            actions: <Widget>[
              TextButton(
                child: const Text("Não"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("Sim"),
                onPressed: () {
                  doUserLogout();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        actions: [
          Observer(
            builder: (_) {
              return Switch(
                value: store.appStore.isDark,
                onChanged: (value) {
                  setState(() {
                    // store.appStore.loadTheme();
                    store.appStore.changeTheme();
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              );
            },
          ),
        ],
      ),
      drawer: DrawerCustom(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                store.isLogged == true
                    ? Column(
                        children: [
                          Text(store.userLoggedNickeName!),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.logout_outlined,
                                size: 24.0,
                              ),
                              label: Text('Desconectar'),
                              onPressed: () =>
                                  store.appStore.isLogged ? areYouSure() : null,
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(deviceWidth * 0.65, 45),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Text("Não conectado"),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.map_outlined,
                                size: 24.0,
                              ),
                              label: Text('Voltar ao Mapa'),
                              onPressed: () => Modular.to.pushNamed('/furgMap'),
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
                              label: Text('Registrar-se'),
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
                        ],
                      ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
