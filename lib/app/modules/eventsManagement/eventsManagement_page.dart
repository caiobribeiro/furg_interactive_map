import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/eventsManagement/eventsManagement_store.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventsManagementPage extends StatefulWidget {
  final String title;
  const EventsManagementPage({Key? key, this.title = 'Criar Evento'})
      : super(key: key);
  @override
  EventsManagementPageState createState() => EventsManagementPageState();
}

class EventsManagementPageState extends State<EventsManagementPage> {
  final EventsManagementStore store = Modular.get();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nome do Evento',
              ),
              onChanged: store.setEventName,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Descrição',
              ),
              onChanged: store.setEventDescription,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
            child: Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.date_range,
              size: 24.0,
            ),
            label: Text('Selecionar Data'),
            onPressed: () {
              _selectDate(context);
            },
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            width: MediaQuery.of(context).size.width - 10,
            height: 300,
            child: GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              initialCameraPosition: store.initialCameraPositionSmallHill,
              onMapCreated: (GoogleMapController controller) {
                store.googleMapController!.complete(controller);
                store.setMapStyle();
              },
              markers: Set.from(store.allEventsPositions),
              // onLongPress: store.addNewwMarkerEvent(),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.save_alt_rounded,
              size: 24.0,
            ),
            label: Text('Criar Evento'),
            onPressed: () {
              _selectDate(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
