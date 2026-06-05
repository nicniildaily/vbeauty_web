import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vbeauty_web/app/app.dart';

void main() {
  testWidgets('App renders without error', (WidgetTester tester) async {
    await tester.pumpWidget(const VelmiqueBeautyApp());
    await tester.pump();
    await tester.pump(const Duration(seconds: 3));
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
