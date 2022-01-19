import 'package:mobx/mobx.dart';

part 'eventUpdater_store.g.dart';

class EventUpdaterStore = _EventUpdaterStoreBase with _$EventUpdaterStore;

abstract class _EventUpdaterStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
