import 'package:mobx/mobx.dart';

part 'bas_store.g.dart';

class BasStore = _BasStoreBase with _$BasStore;
abstract class _BasStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}