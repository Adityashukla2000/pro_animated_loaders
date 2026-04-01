import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_animated_loaders/pro_animated_loaders.dart';

void main() {
  group('ProAnimatedLoader Widget Tests', () {
    testWidgets('Loader renders correctly without message', (
      WidgetTester tester,
    ) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ProAnimatedLoader(type: LoaderType.glowingArc)),
        ),
      );

      // Verify the loader (CustomPaint) exists
      expect(find.byType(CustomPaint), findsOneWidget);

      // Verify no text is rendered when message is null
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('Loader renders message when provided', (
      WidgetTester tester,
    ) async {
      const String loadingText = "Processing Data...";

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProAnimatedLoader(
              type: LoaderType.dots,
              message: loadingText,
            ),
          ),
        ),
      );

      // Verify the message is visible
      expect(find.text(loadingText), findsOneWidget);
    });

    testWidgets('Loader respects custom size', (WidgetTester tester) async {
      const double customSize = 80.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProAnimatedLoader(type: LoaderType.pulse, size: customSize),
          ),
        ),
      );

      // Find the SizedBox that constrains the CustomPaint
      final SizedBox sizedBox = tester.widget(find.byType(SizedBox).first);
      expect(sizedBox.width, customSize);
      expect(sizedBox.height, customSize);
    });
  });
}
