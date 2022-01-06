import 'package:flutter_test/flutter_test.dart';
import 'package:furg_interactive_map/app/modules/furg_phone_list_search/furgPhoneListSearch_store.dart';
 
void main() {
  late FurgPhoneListSearchStore store;

  setUpAll(() {
    store = FurgPhoneListSearchStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}