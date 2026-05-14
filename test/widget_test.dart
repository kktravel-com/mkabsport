import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mkabsport/main.dart';

void main() {
  testWidgets('Sports promotion smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MkAbSportApp());

    // Verify that our app title or a key element is present.
    expect(find.text('MkAbSport - Promotion du Sport'), findsOneWidget);
    expect(find.text('Découvrez nos disciplines'), findsOneWidget);

    // Verify that some sports are listed.
    expect(find.text('Football'), findsOneWidget);
    expect(find.text('Basketball'), findsOneWidget);
  });
}
