import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:item_list/state_container.dart';
import 'package:item_list/widgets/item_tile.dart';

void main() {
  group('ItemItle Widget Tests', () {
    const itemNumber = 10;
    const favoriteButtonKey = Key('icon_$itemNumber');
    const itemTile = MaterialApp(
        home: Scaffold(body: StateContainer(child: ItemTile(itemNumber))));
    testWidgets('should display UI elements', (tester) async {
      await tester.pumpWidget(itemTile);
      final findByType = find.byType(Padding);
      expect(findByType, findsAtLeast(1));
      final titleFinder = find.textContaining(itemNumber.toString());
      expect(titleFinder, findsOneWidget);

      final findByKey = find.byKey(favoriteButtonKey);
      expect(findByKey, findsOneWidget);
      final findByIcon = find.byIcon(Icons.favorite_border);
      expect(findByIcon, findsOneWidget);
      final StateContainerState stateContainerState =
          tester.state(find.byType(StateContainer));
      await tester.tap(findByKey);
      await tester.pump();
      expect(stateContainerState.favoriteItems.contains(itemNumber), true);
      await tester.tap(findByKey);
      await tester.pump();
      expect(stateContainerState.favoriteItems.contains(itemNumber), false);
    });
    testWidgets('should update favorites list on user interaction',
        (tester) async {
      await tester.pumpWidget(itemTile);
      final findByKey = find.byKey(favoriteButtonKey);
      final StateContainerState stateContainerState =
          tester.state(find.byType(StateContainer));
      await tester.tap(findByKey);
      await tester.pump();
      expect(stateContainerState.favoriteItems.contains(itemNumber), true);
      await tester.tap(findByKey);
      await tester.pump();
      expect(stateContainerState.favoriteItems.contains(itemNumber), false);
    });
  });
}
