import 'package:mobx/mobx.dart';

part 'aboutTheProject_store.g.dart';

class AboutTheProjectStore = _AboutTheProjectStoreBase with _$AboutTheProjectStore;
abstract class _AboutTheProjectStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}