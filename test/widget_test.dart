import 'package:flutter_test/flutter_test.dart';
import 'package:profile/main.dart';

void main() {
  testWidgets('Is app there', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    expect(find.byType(App), findsOneWidget);
  });
}
