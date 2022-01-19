import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/aboutTheProject/aboutTheProject_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/customAvatarCard_widget.dart';

class AboutTheProjectPage extends StatefulWidget {
  final String title;
  const AboutTheProjectPage({Key? key, this.title = 'Sobre o projeto'})
      : super(key: key);
  @override
  AboutTheProjectPageState createState() => AboutTheProjectPageState();
}

class AboutTheProjectPageState extends State<AboutTheProjectPage> {
  final AboutTheProjectStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: CustomAvatarCard(),
      ),
    );
  }
}
