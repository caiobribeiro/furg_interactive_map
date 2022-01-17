// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allEvents_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AllEventsStore on _AllEventsStoreBase, Store {
  final _$eventsResponseAtom = Atom(name: '_AllEventsStoreBase.eventsResponse');

  @override
  dynamic get eventsResponse {
    _$eventsResponseAtom.reportRead();
    return super.eventsResponse;
  }

  @override
  set eventsResponse(dynamic value) {
    _$eventsResponseAtom.reportWrite(value, super.eventsResponse, () {
      super.eventsResponse = value;
    });
  }

  final _$customTileExpandedAtom =
      Atom(name: '_AllEventsStoreBase.customTileExpanded');

  @override
  bool get customTileExpanded {
    _$customTileExpandedAtom.reportRead();
    return super.customTileExpanded;
  }

  @override
  set customTileExpanded(bool value) {
    _$customTileExpandedAtom.reportWrite(value, super.customTileExpanded, () {
      super.customTileExpanded = value;
    });
  }

  @override
  String toString() {
    return '''
eventsResponse: ${eventsResponse},
customTileExpanded: ${customTileExpanded}
    ''';
  }
}
