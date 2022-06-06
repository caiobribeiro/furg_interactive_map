import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/registrationUser/registrationUser_store.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class RegistrationUserPage extends StatefulWidget {
  final String title;
  const RegistrationUserPage({Key? key, this.title = 'RegistrationUserPage'})
      : super(key: key);
  @override
  RegistrationUserPageState createState() => RegistrationUserPageState();
}

class RegistrationUserPageState extends State<RegistrationUserPage> {
  final RegistrationUserStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: Text("Registro"),
    );
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    // final appBarHeight = appBar.preferredSize.height;
    // final statusBarHeight = MediaQuery.of(context).padding.top;
    // final deviceHeight = screenHeight - appBarHeight - statusBarHeight;

    void showSuccess(String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Success!"),
            content: Text(message),
            actions: <Widget>[
              new TextButton(
                child: const Text("OK"),
                onPressed: () {
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

    _resgisterUser() async {
      final emailRegisterFurg =
          store.registerEmail + store.registerFurgEmailType;
      final user = ParseUser.createUser(
          store.registerNickName, store.registerPassword, emailRegisterFurg)
        ..set('userFirstName', store.registerFirstName)
        ..set('userLastName', store.registerLastName);

      var response = await user.signUp();

      if (response.success) {
        store.saveUser();
        showSuccess("Conta registrada com sucesso!");
      } else {
        showError(response.error!.message);
      }
    }

    return Scaffold(
      appBar: appBar,
      body: Container(
        height: screenHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(30, 80, 30, 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(),
                    hintText: 'Nome de Usuário',
                  ),
                  onChanged: store.setRegisterNickName,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(),
                    hintText: 'Nome',
                  ),
                  onChanged: store.setRegisterFirstName,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(),
                    hintText: 'Sobrenome',
                  ),
                  onChanged: store.setRegisterLastName,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30, 10, 10, 10),
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
                  ),
                  Observer(builder: (_) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 30, 10),
                      child: DropdownButton<String>(
                        value: store.registerFurgEmailType,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        // style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String? value) {
                          store.setRegisterFurgEmailType(value!);
                        },
                        items: <String>[
                          '@furg.br',
                          '@hu.furg.br',
                          '@faherg.furg.br',
                          '@uab.furg.br',
                          '@faurg.furg.br',
                          '@nti.furg.br',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    );
                  })
                ],
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
                  onPressed: () {
                    _resgisterUser();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
