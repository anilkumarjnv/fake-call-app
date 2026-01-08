import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fake_call_app/main.dart';

void main() {
  testWidgets('Fake Call App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app bar title is correct.
    expect(find.text('Setup Fake Call'), findsOneWidget);

    // Verify that the 'Schedule Call' button is present.
    expect(find.widgetWithText(ElevatedButton, 'Schedule Call'), findsOneWidget);
  });
}
