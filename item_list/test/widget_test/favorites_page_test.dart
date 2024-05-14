import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:item_list/screen/screens.dart';
import 'package:item_list/state_container.dart';

void main() {
  group('Favorite Page Widget Test', () {
    const stateContainer = StateContainer(child: FavoritesPage());
    const itemNo = 10;
    testWidgets('should display UI elements', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: stateContainer,
      ));
      expect(find.text('Favorites'), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Item $itemNo'), findsNothing);
    });
  });
}
