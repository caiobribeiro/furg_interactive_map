import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/furg_phone_list_search/furgPhoneListSearch_store.dart';
import 'package:flutter/material.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class FurgPhoneListSearchPage extends StatefulWidget {
  final String title;
  const FurgPhoneListSearchPage(
      {Key? key, this.title = 'Pesquisar na Universidade'})
      : super(key: key);
  @override
  FurgPhoneListSearchPageState createState() => FurgPhoneListSearchPageState();
}

class FurgPhoneListSearchPageState extends State<FurgPhoneListSearchPage> {
  final FurgPhoneListSearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    const historyLength = 5;
    String selectedTerm;

    List<String> _searchHistory = [
      'deus',
      'eh',
      'cantor',
    ];

    List<String> filteredSearchHistory;

    List<String> filterSearchTerms({
      required String filter,
    }) {
      if (filter != null && filter.isNotEmpty) {
        return _searchHistory.reversed
            .where((term) => term.startsWith(filter))
            .toList();
      } else {
        return _searchHistory.reversed.toList();
      }
    }

    void addSearchTerm(String term) {
      if (_searchHistory.contains(term)) {
        // putSearchtermFirst(term);
        return;
      }

      _searchHistory.add(term);
      if (_searchHistory.length > historyLength) {
        _searchHistory.removeRange(0, _searchHistory.length - historyLength);
      }

      filteredSearchHistory = filterSearchTerms(filter: "null");
    }

    void deleteSearchTerm(String term) {
      _searchHistory.removeWhere((t) => t == term);
      filteredSearchHistory = filterSearchTerms(filter: "null");
    }

    void putSearchTermFirst(String term) {
      deleteSearchTerm(term);
      addSearchTerm(term);
    }

    @override
    void initState() {
      super.initState();
      filteredSearchHistory = filterSearchTerms(filter: "null");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Text(
            "Encontre aqui os telefones de pessoas ou setores da universidade.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
