<<<<<<< HEAD
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculator_redux/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(CalculatorScreen());
=======
import 'package:calculator_redux/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());
>>>>>>> 09a58b9f835fff20b1739467842b3e79fc1ac665

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
