import 'package:mobx/mobx.dart';

part 'moreLinks_store.g.dart';

class MoreLinksStore = _MoreLinksStoreBase with _$MoreLinksStore;
abstract class _MoreLinksStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}