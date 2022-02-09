import 'package:flutter_test/flutter_test.dart';
import 'package:furg_interactive_map/app/modules/moreLinks/moreLinks_store.dart';
 
void main() {
  late MoreLinksStore store;

  setUpAll(() {
    store = MoreLinksStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}