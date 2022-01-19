import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/eventUpdater/eventUpdater_store.dart';
import 'package:flutter/material.dart';

class EventUpdaterPage extends StatefulWidget {
  final String title;
  const EventUpdaterPage({Key? key, this.title = 'EventUpdaterPage'}) : super(key: key);
  @override
  EventUpdaterPageState createState() => EventUpdaterPageState();
}
class EventUpdaterPageState extends State<EventUpdaterPage> {
  final EventUpdaterStore store = Modular.get();

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