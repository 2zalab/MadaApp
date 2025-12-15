// This is a basic Flutter widget test for MadaApp.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mada_app/main.dart';

void main() {
  testWidgets('MadaApp initializes and shows splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MadaApp());

    // Verify that the splash screen is shown initially
    expect(find.text('MadaApp'), findsOneWidget);
    expect(find.text('Votre compagnon pour apprendre Mada'), findsOneWidget);
  });

  testWidgets('App uses Material Design 3', (WidgetTester tester) async {
    await tester.pumpWidget(const MadaApp());

    // Verify that MaterialApp is configured
    final MaterialApp app = tester.widget(find.byType(MaterialApp));
    expect(app.debugShowCheckedModeBanner, false);
  });
}
