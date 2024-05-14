import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:item_list/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Test The Whole App', () {
    const itemNo = 1;

    testWidgets('Test entire user flow', (tester) async {
      await tester.pumpApp();

      // Check initial state
      expect(find.byIcon(Icons.favorite), findsNothing);

      // Add an item to favorites
      await tester.tap(find.byKey(const Key('icon_$itemNo')));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.favorite), findsOneWidget);

      // Navigate to favorites page
      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();
      expect(find.text('Favorites'), findsOneWidget);
      expect(find.byKey(const Key('favorites_text_$itemNo')), findsOneWidget);

      // Remove an item from favorites
      await tester.tap(find.byKey(const Key('remove_icon_$itemNo')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('favorites_text_$itemNo')), findsNothing);

      // Navigate back to home page
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('Item List'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpApp() async {
    app.main();
    await pumpAndSettle();
  }
}
