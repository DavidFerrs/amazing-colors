// ignore_for_file: avoid_non_null_assertion
import 'package:amazing_colors/app/core/styles/app_colors.dart';
import 'package:amazing_colors/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Home page End to End test', () {
    testWidgets('Check if the text "Hello there!" is on the home page', (
      WidgetTester tester,
    ) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Hello there!'), findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets(
      'Verify if the app starts on the default background color white',
      (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        final AnimatedContainer animatedContainer = tester.firstWidget(
          find.byType(AnimatedContainer),
        );
        expect(
          (animatedContainer.decoration! as BoxDecoration).color,
          AppColors.plainWhite,
        );

        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      'Test to check if the color of the background changes when tap',
      (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        await tester.tapAt(const Offset(100.0, 100.0));
        await tester.pumpAndSettle();

        final AnimatedContainer animatedContainer = tester.firstWidget(
          find.byType(AnimatedContainer),
        );

        expect(
          (animatedContainer.decoration! as BoxDecoration).color,
          isNot(equals(AppColors.plainWhite)),
        );

        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      'Test multiple taps to see the color changes',
      (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        // 1.Find the color of the animated container on the screen
        Color getCurrentColor() {
          final container =
              tester.firstWidget(
                    find.byType(AnimatedContainer),
                  )
                  as AnimatedContainer;

          return (container.decoration! as BoxDecoration).color!;
        }

        // 2. Find the root or background widget covering the screen
        final screenFinder = find.byType(MaterialApp);

        // 3. Get the offset from the center of the screen.
        final center = tester.getCenter(screenFinder);

        // 4. Save the value of the actual color
        var actualColor = getCurrentColor();

        const numberOfCicles = 20;
        for (int i = 0; i < numberOfCicles; i++) {
          // 5. Tap the screen
          await tester.tapAt(center);
          await tester.pumpAndSettle();

          // 6. Save the value of the new color.
          final newColor = getCurrentColor();

          // 7. Verify the change in the color from the previous one
          expect(
            newColor,
            isNot(equals(actualColor)),
          );

          actualColor = newColor;
        }

        await tester.pumpAndSettle();
      },
    );
  });
}
