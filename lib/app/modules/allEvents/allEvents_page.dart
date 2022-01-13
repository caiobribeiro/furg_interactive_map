import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/allEvents/allEvents_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/customDrawer.dart';

import '../../app_store.dart';

class AllEventsPage extends StatefulWidget {
  final String title;
  const AllEventsPage({Key? key, this.title = 'Todos os Eventos'})
      : super(key: key);
  @override
  AllEventsPageState createState() => AllEventsPageState();
}

class AllEventsPageState extends State<AllEventsPage> {
  final AllEventsStore store = Modular.get();
  final AppStore _appStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerCustom(),
      body: Observer(builder: (_) {
        return Column(
          children: [
            ListTile(
              onTap: () {},
              title: Text('Evento X'),
              leading: Icon(Icons.business_rounded),
            ),
            _appStore.isLogged == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            Modular.to.pushNamed('/eventsManagament'),
                        child: Text("Criar Eventos"),
                      ),
                    ],
                  )
                : Container(),
          ],
        );
      }),
    );
  }
}
