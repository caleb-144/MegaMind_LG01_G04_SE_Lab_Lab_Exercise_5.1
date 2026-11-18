import 'package:flutter_test/flutter_test.dart';
import 'package:studenthub/main.dart';

void main() {
  testWidgets('StudentHub app loads successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(const StudentHubApp());

    // Verify that the StudentHub application loads.
    expect(find.byType(StudentHubApp), findsOneWidget);

    // Verify that the home page is displayed.
    expect(find.text('StudentHub'), findsOneWidget);
  });
}
