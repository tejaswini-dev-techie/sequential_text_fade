import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sequential_text_fade/sequential_text_fade.dart';

void main() {
  testWidgets('Text changes sequentially', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SequentialTextFade(
          sequentialTextsList: [
            'JOIN THE FUN',
            'STAY TUNED',
            'GET READY',
            'DISCOVER MORE',
            'BE PART OF IT',
            'JUST IN',
          ],
          duration: Duration(seconds: 3),
          delay: Duration(seconds: 3),
          textAlignment: Alignment.centerLeft,
          textStyle: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            color: Colors.blue,
          ),
        ),
      ),
    ));

    // Initially, the first text should be displayed
    expect(find.text('JOIN THE FUN'), findsOneWidget);

    // Wait for the duration + delay to let the text change
    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(seconds: 3));

    // Verify that the second text is displayed after delay
    expect(find.text('STAY TUNED'), findsOneWidget);

    // Continue the same for other texts
    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(seconds: 3));
    expect(find.text('GET READY'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(seconds: 3));
    expect(find.text('DISCOVER MORE'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(seconds: 3));
    expect(find.text('BE PART OF IT'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(seconds: 3));
    expect(find.text('JUST IN'), findsOneWidget);
  });
}
