import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/resetPassword/resetPassword_store.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ResetPasswordPage extends StatefulWidget {
  final String title;
  const ResetPasswordPage({Key? key, this.title = 'ResetPasswordPage'})
      : super(key: key);
  @override
  ResetPasswordPageState createState() => ResetPasswordPageState();
}

class ResetPasswordPageState extends State<ResetPasswordPage> {
  final ResetPasswordStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: Text("Recuperação de Senha"),
    );
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    // final appBarHeight = appBar.preferredSize.height;
    // final statusBarHeight = MediaQuery.of(context).padding.top;
    // // final deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = screenHeight - appBarHeight - statusBarHeight;

    void showSuccess(String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
                "Password reset instructions have been sent to email!!"),
            content: Text(message),
            actions: <Widget>[
              new TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Modular.to.navigate('/login');
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
            title: Text(errorMessage),
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

    void doUserResetPassword() async {
      final ParseUser user = ParseUser(null, null, store.recoverEmail);
      final ParseResponse parseResponse = await user.requestPasswordReset();
      if (parseResponse.success) {
        showSuccess(
            "As instruções de recuperação de senha foram enviadas para o email");
      } else {
        showError(parseResponse.error!.message);
      }
    }

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 80, 0, 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                  onChanged: store.setrecoverEmail,
                ),
              ),
              Observer(
                builder: (_) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.email_outlined,
                        size: 24.0,
                      ),
                      label: Text('Recuperar'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(330, 50),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () => store.isRecoverFormValid
                          ? doUserResetPassword()
                          : null,
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
