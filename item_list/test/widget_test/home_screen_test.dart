import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:item_list/main.dart';

void main() {
  group('Home Screen Widget Test', () {
    const myApp = MyApp();
    testWidgets('should show UI elements', (tester) async {
      await tester.pumpWidget(myApp);
      expect(find.byType(AppBar), findsExactly(1));
      const appName = 'Item List';
      expect(find.text(appName), findsOne);
      expect(find.text('Favorites'), findsOne);
      expect(find.byType(ListView), findsAny);
// Uncomment the following lines after resolving the exception.
      // expect(find.byType(TextButton), findsOneWidget);
    });
    testWidgets('should scroll through items', (tester) async {
      await tester.pumpWidget(myApp);
      const itemNumber = 50;
      await tester.scrollUntilVisible(
          find.byKey(const Key('text_$itemNumber')), 500);
      expect(find.text('Item $itemNumber'), findsOne);
    });
  });
}
