import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/furg_phone_list_search/furgPhoneListSearch_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/models/phone_list_model.dart';
import 'package:furg_interactive_map/app/widgets/customDrawer.dart';
import 'package:url_launcher/url_launcher.dart';

class FurgPhoneListSearchPage extends StatefulWidget {
  final String title;
  final String buildingSearch;
  const FurgPhoneListSearchPage(
      {Key? key,
      this.title = 'Pesquisar na Universidade',
      required this.buildingSearch})
      : super(key: key);
  @override
  FurgPhoneListSearchPageState createState() => FurgPhoneListSearchPageState();
}

class FurgPhoneListSearchPageState extends State<FurgPhoneListSearchPage> {
  final FurgPhoneListSearchStore store = Modular.get();

  @override
  void initState() {
    store.searchPhoneListString = "${widget.buildingSearch}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: DrawerCustom(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white30,
                border: OutlineInputBorder(),
                hintText: 'Pesquisar',
              ),
              onChanged: store.setSearchTelListString,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Encontre aqui os telefones de pessoas ou setores da universidade.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Divider(),
          Observer(
            builder: (_) {
              store.searchPhoneListString;
              return Expanded(
                child: FutureBuilder<PhoneListApi>(
                  future: store.getPhoneSearch(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final responseResultPhoneSearch = snapshot.data;
                      return Container(
                        child: ListView.builder(
                          itemCount:
                              responseResultPhoneSearch!.res!.telefones!.length,
                          itemBuilder: (BuildContext context, i) {
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12.0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "${responseResultPhoneSearch.res!.telefones![i].unidade}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Divider(),
                                      Text(
                                          "Servidores: ${responseResultPhoneSearch.res!.telefones![i].pessoas!}",
                                          textAlign: TextAlign.left),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      ),
                                      Text(
                                          "Câmpus/Prédio: ${responseResultPhoneSearch.res!.telefones![i].nmLocal!}",
                                          textAlign: TextAlign.left),
                                      OutlinedButton(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 0),
                                              child: Icon(
                                                Icons.phone_callback_outlined,
                                                color: Colors.grey,
                                                size: 22.0,
                                              ),
                                            ),
                                            Text(
                                                "Telefone: (${responseResultPhoneSearch.res!.telefones![i].nrDdd}) ${responseResultPhoneSearch.res!.telefones![i].nrTelefone}",
                                                textAlign: TextAlign.left),
                                          ],
                                        ),
                                        onPressed: () {
                                          launch(
                                              "tel://${responseResultPhoneSearch.res!.telefones![i].nrDdd}) ${responseResultPhoneSearch.res!.telefones![i].nrTelefone}");
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.5,
                                  // color: Colors.black,
                                ),
                              ],
                            );
                          },
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20),
                          topRight: const Radius.circular(20),
                        )),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void openBottomSheet() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FutureBuilder<PhoneListApi>(
          future: store.getPhoneSearch(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final responseResultPhoneSearch = snapshot.data;
              return Container(
                child: ListView.builder(
                  itemCount: responseResultPhoneSearch!.res!.telefones!.length,
                  itemBuilder: (BuildContext context, i) {
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12.0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "${responseResultPhoneSearch.res!.telefones![i].unidade}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Divider(),
                                      Text(
                                          "Servidores: ${responseResultPhoneSearch.res!.telefones![i].pessoas!}",
                                          textAlign: TextAlign.left),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      ),
                                      Text(
                                          "Câmpus/Prédio: ${responseResultPhoneSearch.res!.telefones![i].nmLocal!}",
                                          textAlign: TextAlign.left),
                                      OutlinedButton(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 0),
                                              child: Icon(
                                                Icons.phone_callback_outlined,
                                                color: Colors.grey,
                                                size: 22.0,
                                              ),
                                            ),
                                            Text(
                                                "Telefone: (${responseResultPhoneSearch.res!.telefones![i].nrDdd}) ${responseResultPhoneSearch.res!.telefones![i].nrTelefone}",
                                                textAlign: TextAlign.left),
                                          ],
                                        ),
                                        onPressed: () {
                                          launch(
                                              "tel://${responseResultPhoneSearch.res!.telefones![i].nrDdd}) ${responseResultPhoneSearch.res!.telefones![i].nrTelefone}");
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.5,
                            // color: Colors.black,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                )),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
