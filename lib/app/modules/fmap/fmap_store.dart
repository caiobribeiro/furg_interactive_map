import 'package:mobx/mobx.dart';

part 'fmap_store.g.dart';

class FmapStore = _FmapStoreBase with _$FmapStore;
abstract class _FmapStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}