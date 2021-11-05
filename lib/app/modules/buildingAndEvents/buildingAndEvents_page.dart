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
            onPressed: () {
              showSearch(context: context, delegate: BuildingSearch());
            },
            child: Icon(Icons.ac_unit),
          )
        ],
      ),
    );
  }
}

class BuildingSearch extends SearchDelegate<String?> {
  final exemplos = [
    'C3',
    'CC',
    'Cidec',
    'RU',
  ];

  final sugestoes = [
    'deus',
    'Cé',
    'cantor',
  ];

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.textsms),
            ),
            Text(query),
          ],
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    final recentSearch = query.isEmpty
        ? sugestoes
        : exemplos.where((exemplo) {
            final cityLower = exemplo.toLowerCase();
            final queryLower = query.toLowerCase();

            return queryLower.startsWith(queryLower);
          }).toList();
    return buildSuggestionsSuccess(recentSearch);
  }

  Widget buildSuggestionsSuccess(List<String> sugestoes) => ListView.builder(
        itemCount: sugestoes.length,
        itemBuilder: (BuildContext context, int index) {
          final sugestao = sugestoes[index];
          return ListTile(
            title: Text(sugestao),
            leading: Icon(Icons.ac_unit),
          );
        },
      );
}
