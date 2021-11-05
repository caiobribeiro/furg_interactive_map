import 'package:flutter/material.dart';

class BuildingAndEventsPage extends StatefulWidget {
  final String title;
  const BuildingAndEventsPage({Key? key, this.title = 'BuildingAndEventsPage'}) : super(key: key);
  @override
  BuildingAndEventsPageState createState() => BuildingAndEventsPageState();
}
class BuildingAndEventsPageState extends State<BuildingAndEventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}