import 'package:mobx/mobx.dart';

part 'buildingAndEvents_store.g.dart';

class BuildingAndEventsStore = _BuildingAndEventsStoreBase with _$BuildingAndEventsStore;
abstract class _BuildingAndEventsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}