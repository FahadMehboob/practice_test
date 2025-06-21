import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice_test/app/app.dart';

void main() {
  testWidgets("Calculator Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byKey(const Key("result")), findsOneWidget);

    final d1 = expect(find.byKey(
      Key("displayOne"),
    ));
    var d2 = expect(
        find.byKey(
          Key("displayTwo"),
        ),
        findsOneWidget);
  });
}
