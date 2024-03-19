import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('Login Page Test', () {
    testWidgets('Login Page: email field wrong', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(home: Scaffold(body: LoginPage())),
      ));

      final emailField = find.byKey(const Key('email_field_login'));
      await tester.enterText(emailField, 'pippo');
      await tester.pump(const Duration(milliseconds: 100));
      final emailErrorField = find.text('Error: Enter a valid email address');
      expect(emailErrorField, findsOneWidget);
    });

    testWidgets('Login Page: email field empty', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(home: Scaffold(body: LoginPage())),
      ));

      final emailField = find.byKey(const Key('email_field_login'));
      await tester.enterText(emailField, 'p');
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.pump(const Duration(milliseconds: 100));
      final emailErrorField = find.text('Error: Email field is empty');
      expect(emailErrorField, findsOneWidget);
    });

    testWidgets('Login Page: email field is correct', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(home: Scaffold(body: LoginPage())),
      ));

      final emailField = find.byKey(const Key('email_field_login'));
      await tester.enterText(emailField, 'pippo@gmail.com');
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.pump(const Duration(milliseconds: 100));
      final emailErrorField = find.text('Error: Enter a valid email address');
      expect(emailErrorField, findsNothing);
    });
  });
}
