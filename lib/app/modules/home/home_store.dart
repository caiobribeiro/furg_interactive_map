import 'package:furg_interactive_map/app/app_store.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }

  final AppStore appStore;
  HomeStoreBase(this.appStore);
}
