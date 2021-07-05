import 'package:flutter_test/flutter_test.dart';
import 'package:furg_interactive_map/app/modules/bas/bas_store.dart';
 
void main() {
  late BasStore store;

  setUpAll(() {
    store = BasStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}