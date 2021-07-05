import 'package:flutter_test/flutter_test.dart';
import 'package:furg_interactive_map/app/modules/auth/auth_store.dart';
 
void main() {
  late AuthStore store;

  setUpAll(() {
    store = AuthStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}