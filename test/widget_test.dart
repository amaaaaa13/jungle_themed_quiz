import 'package:flutter_test/flutter_test.dart';
import 'package:jungle_themed_quiz/main.dart';

void main() {
  testWidgets('Jungle Quiz app loads and displays the title',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const JungleQuizApp());

    // Verify that the splash screen shows 'Jungle Quiz!'
    expect(find.text('Jungle Quiz!'), findsOneWidget);

    // Wait for the transition to HomeScreen (3 seconds in SplashScreen)
    await tester.pumpAndSettle();

    // Verify that we are now on the HomeScreen
    expect(find.text('Welcome to the Jungle Quiz!'), findsOneWidget);
  });
}
