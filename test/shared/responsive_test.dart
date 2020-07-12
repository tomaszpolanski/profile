import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/shared/responsive.dart';

void main() {
  group('ResponsiveWidget', () {
    testWidgets('wide layout uses IntrinsicHeight', (tester) async {
      setWindowSize(const Size.square(2000));
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: ResponsiveWidget(
            builder: (_, child, ___) => child,
            children: const [SizedBox()],
          ),
        ),
      );

      expect(find.byType(IntrinsicHeight), findsOneWidget);
    });
  });

  group('ResponsiveBuilder', () {
    testWidgets('debugFillProperties', (tester) async {
      const snapPoint = 42.0;
      final widget = ResponsiveBuilder(
        snapPoint: snapPoint,
        builder: (_, __) => const SizedBox(),
      );
      final tested = DiagnosticPropertiesBuilder();

      widget.debugFillProperties(tested);

      final DoubleProperty property = tested.properties.first;
      expect(property.value, snapPoint);
    });
  });
}

void setWindowSize(Size size) {
  final AutomatedTestWidgetsFlutterBinding binding = WidgetsBinding.instance;
  binding.window.physicalSizeTestValue = size * binding.window.devicePixelRatio;
}
