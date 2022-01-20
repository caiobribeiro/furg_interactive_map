import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/allEvents/allEvents_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/customDrawer.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

class AllEventsPage extends StatefulWidget {
  final String title;
  const AllEventsPage({Key? key, this.title = 'Todos os Eventos'})
      : super(key: key);
  @override
  AllEventsPageState createState() => AllEventsPageState();
}

class AllEventsPageState extends State<AllEventsPage> {
  final AllEventsStore store = Modular.get();

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

  Future<List<ParseObject>> _getAllEvents() async {
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('Event'));
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      store.eventsResponse = apiResponse.results as List<ParseObject>;
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  _deleteEvent(eventId) async {
    var evenDelete = ParseObject('Event')..objectId = eventId;
    await evenDelete.delete();
  }

  void _launchURL(link) async {
    if (await canLaunch(link)) {
      await launch(
        link,
        forceSafariVC: true, // IOS
        forceWebView: true, // Android
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    void deleteConfirmation(eventId) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Você deseja deletar este evento?"),
            actions: <Widget>[
              new TextButton(
                child: const Text("Sim"),
                onPressed: () {
                  _deleteEvent(eventId);
                  Navigator.of(context).pop();
                  Modular.to.navigate('/furgMap');
                },
              ),
              new TextButton(
                child: const Text("Não"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerCustom(),
      body: Observer(builder: (_) {
        return Column(
          children: [
            Expanded(
              child: FutureBuilder<List<ParseObject>>(
                future: _getAllEvents(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: Container(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator()),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error..."),
                        );
                      }
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text("No Data..."),
                        );
                      } else {
                        return ListView.builder(
                          padding: EdgeInsets.only(top: 10.0),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            //*************************************
                            //Get Parse Object Values
                            final allEventsApiResponse = snapshot.data![index];
                            final eventName =
                                allEventsApiResponse.get<String>('eventName')!;
                            final eventDescription = allEventsApiResponse
                                .get<String>('eventDescription')!;
                            final eventUserEmail = allEventsApiResponse
                                .get<String>('userFurgEmail')!;
                            final eventOficialSite = allEventsApiResponse
                                .get<String>('eventOficialSite')!;
                            final eventImageLink = allEventsApiResponse
                                .get<String>('eventImageLink')!;
                            final userNickName = allEventsApiResponse
                                .get<String>('userNickName')!;
                            final eventId =
                                allEventsApiResponse.get<String>('objectId')!;
                            final eventStart = DateFormat('dd-MM-yyyy').format(
                                allEventsApiResponse
                                    .get<DateTime>('eventStart')!);
                            final eventEnd = DateFormat('dd-MM-yyyy').format(
                                allEventsApiResponse
                                    .get<DateTime>('eventEnd')!);
                            //*************************************

                            return Observer(
                              builder: (_) {
                                return ExpansionTile(
                                  title: Text(eventName),
                                  subtitle: Text('Criado por: $userNickName'),
                                  trailing: Icon(
                                    store.customTileExpanded
                                        ? Icons.arrow_drop_down_circle
                                        : Icons.arrow_drop_down,
                                  ),
                                  onExpansionChanged: (bool expanded) {
                                    store.customTileExpanded = expanded;
                                  },
                                  children: <Widget>[
                                    Image.network(
                                      eventImageLink,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 10, 10),
                                          child: Text("Início: $eventStart"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(10, 0, 0, 10),
                                          child: Text("Término: $eventEnd"),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.web_rounded,
                                          size: 24.0,
                                        ),
                                        label: Text('Site Oficial'),
                                        onPressed: () =>
                                            _launchURL(eventOficialSite),
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              45),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(eventDescription),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child:
                                          Text("Reponsável: $eventUserEmail"),
                                    ),
                                    store.userLoggedNickeName == userNickName
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 10, 0, 10),
                                                child: ElevatedButton.icon(
                                                  icon: Icon(
                                                    Icons.mode,
                                                    size: 24.0,
                                                  ),
                                                  label:
                                                      Text('Modificar evento'),
                                                  onPressed: () {
                                                    Modular.to.navigate(
                                                        '/eventUpdaterModule',
                                                        arguments: eventId);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    minimumSize: Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.20,
                                                        45),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 10, 0, 10),
                                                child: ElevatedButton.icon(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    size: 24.0,
                                                  ),
                                                  label: Text('Deletar evento'),
                                                  onPressed: () {
                                                    deleteConfirmation(eventId);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.red,
                                                    minimumSize: Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.20,
                                                        45),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      }
                  }
                },
              ),
            ),
            store.isLogged == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.add,
                            size: 24.0,
                          ),
                          label: Text('Criação de Evento'),
                          onPressed: () {
                            Modular.to.pushNamed('/eventsManagament');
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.65, 45),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
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
