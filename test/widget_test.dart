import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:studenthub/main.dart';
import 'package:studenthub/providers/share_state_management.dart';

void main() {
  testWidgets('StudentHub app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ShareStateManagement(),
        child: const StudentHubApp(),
      ),
    );

    // Verify the application loads
    expect(find.text('StudentHub'), findsOneWidget);

    // Verify the home page is displayed
    expect(find.text('Home'), findsWidgets);
  });
}
