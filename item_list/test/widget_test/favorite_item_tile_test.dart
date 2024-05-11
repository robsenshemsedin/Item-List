import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:item_list/state_container.dart';
import 'package:item_list/widgets/favorite_item_tile.dart';

void main() {
  group('FavoriteItemTile Widget test', () {
    const itemNumber = 10;
    const removeButtonKey = Key('remove_icon_$itemNumber');
    const favoriteItemTile = MaterialApp(
        home: Scaffold(
            body: StateContainer(child: FavoriteItemTile(itemNumber))));
    testWidgets('should display UI elements', (tester) async {
      await tester.pumpWidget(favoriteItemTile);
      final titleFinder = find.textContaining(itemNumber.toString());
      expect(titleFinder, findsOneWidget);
      final findByType = find.byType(Padding);
      expect(findByType, findsAtLeast(1));
      const removeButtonKey = Key('remove_icon_$itemNumber');
      final findByKey = find.byKey(removeButtonKey);
      expect(findByKey, findsOneWidget);
      final findByIcon = find.byIcon(Icons.close);
      expect(findByIcon, findsOneWidget);
    });
    testWidgets('should remove favorite Item with user interaction',
        (tester) async {
      await tester.pumpWidget(favoriteItemTile);
      final findByKey = find.byKey(removeButtonKey);
      await tester.tap(findByKey);
      await tester.pump();
      final findByText = find.text('Removed from favorites.');
      expect(findByText, findsOneWidget);
    });
  });
}
