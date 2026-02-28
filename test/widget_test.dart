// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:player_by_niloy/main.dart';
import 'package:player_by_niloy/screens/home_screen.dart';

void main() {
  testWidgets('Test App loading and Drawer visibility', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the HomeScreen is loaded.
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(
      find.text(
        'Welcome to Player by NILOY\nUse the three bar menu to navigate.',
      ),
      findsOneWidget,
    );

    // Verify that the AppBar title is correct.
    expect(find.text('Player by NILOY'), findsOneWidget);
  });
}
