import 'package:flutter_test/flutter_test.dart';
import 'package:studenthub/main.dart';

void main() {
  testWidgets('StudentHub app loads successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(const StudentHubApp());

    expect(find.byType(StudentHubApp), findsOneWidget);
  });
}
