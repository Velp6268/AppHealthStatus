import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:health_status/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test authentication flow', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('emailTextField')), findsOneWidget);
    expect(find.byKey(const Key('passwordTextField')), findsOneWidget);
    expect(find.byKey(const Key('buttonAuth')), findsOneWidget);

    await tester.enterText(find.byKey(Key('emailTextField')), 'admin@admin.admin');
    await tester.enterText(find.byKey(Key('passwordTextField')), 'adminadmin');

    await tester.tap(find.byKey(Key('buttonAuth')));
    await tester.pumpAndSettle();

  });
}
