import 'package:flutter_test/flutter_test.dart';
import 'package:item_list/state_container.dart';

void main() {
  final StateContainerState state = StateContainerState();
  group('StateContainerState methods test', () {
    test('Initially, the favoriteItems list should be empty', () {
      expect(state.favoriteItems.isEmpty, true);
    });
    test('favoriteItems should contain the added value', () {
      state.addItem(1);
      expect(state.favoriteItems.contains(1), true);
    });
    test("favoriteItems shouldn't contain the deleted value", () {
      state.removeItem(1);
      expect(state.favoriteItems.contains(1), false);
    });
  });
}
