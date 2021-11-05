import 'package:flutter_test/flutter_test.dart';
import 'package:furg_interactive_map/app/modules/buildingAndEvents/buildingAndEvents_store.dart';
 
void main() {
  late BuildingAndEventsStore store;

  setUpAll(() {
    store = BuildingAndEventsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}