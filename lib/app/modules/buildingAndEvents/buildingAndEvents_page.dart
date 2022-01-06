import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/buildingAndEvents/buildingAndEvents_store.dart';
import 'package:flutter/material.dart';

class BuildingAndEventsPage extends StatefulWidget {
  final String title;
  const BuildingAndEventsPage({Key? key, this.title = 'BuildingAndEventsPage'})
      : super(key: key);
  @override
  BuildingAndEventsPageState createState() => BuildingAndEventsPageState();
}

class BuildingAndEventsPageState extends State<BuildingAndEventsPage> {
  final BuildingAndEventsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.ac_unit),
          )
        ],
      ),
    );
  }
}
