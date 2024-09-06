import 'package:calculator_redux/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Wait for the widget tree to be fully built
    await tester.pumpAndSettle();

    // Debugging: Print the widget tree
    debugDumpApp();

    // Verify that the counter starts at 0
    expect(find.text('0'), findsOneWidget);

    // Tap the '+' icon and trigger a frame
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the counter increments to 1
    expect(find.text('1'), findsOneWidget);
  });
}
