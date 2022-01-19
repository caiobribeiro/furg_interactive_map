import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
part 'allEvents_store.g.dart';

class AllEventsStore = _AllEventsStoreBase with _$AllEventsStore;

abstract class _AllEventsStoreBase with Store {
  @observable
  var eventsResponse;

  @observable
  bool customTileExpanded = false;

  @observable
  bool isLogged = false;

  @observable
  String userLoggedNickeName = "";
}
