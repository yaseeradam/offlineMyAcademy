import 'package:flutter_test/flutter_test.dart';
import 'package:smartlink/main.dart';

void main() {
  testWidgets('App starts', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartLinkApp());
    // Basic verification that we have a MaterialApp
    expect(find.byType(SmartLinkApp), findsOneWidget);
  });
}
