import 'package:flutter_test/flutter_test.dart';
import 'package:furg_interactive_map/app/modules/aboutTheProject/aboutTheProject_store.dart';
 
void main() {
  late AboutTheProjectStore store;

  setUpAll(() {
    store = AboutTheProjectStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}