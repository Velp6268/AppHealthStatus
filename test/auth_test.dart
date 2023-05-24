import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_status/main.dart';





void main() {
  testWidgets('LoginView UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Root(),
      ),
    );


    final loginViewFinder = find.byType(LoginView);

    expect(loginViewFinder, findsOneWidget);



    await tester.pumpWidget(
      MaterialApp(
        home: LoginView(),
      ),
    );

    expect(find.byKey(const Key('emailTextField')), findsOneWidget);
    expect(find.byKey(const Key('passwordTextField')), findsOneWidget);
    expect(find.byKey(const Key('buttonAuth')), findsOneWidget);

    await tester.enterText(find.byKey(const Key('emailTextField')), 'admin@admin.admin');
    await tester.enterText(find.byKey(const Key('passwordTextField')), 'adminadmin');
    await tester.tap(find.byKey(const Key('buttonAuth')));
    await tester.pump();


  });
}

