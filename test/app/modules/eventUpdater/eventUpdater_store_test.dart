import 'package:flutter_test/flutter_test.dart';
import 'package:furg_interactive_map/app/modules/eventUpdater/eventUpdater_store.dart';
 
void main() {
  late EventUpdaterStore store;

  setUpAll(() {
    store = EventUpdaterStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}