import 'package:mobx/mobx.dart';

part 'furgPhoneListSearch_store.g.dart';

class FurgPhoneListSearchStore = _FurgPhoneListSearchStoreBase with _$FurgPhoneListSearchStore;
abstract class _FurgPhoneListSearchStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}