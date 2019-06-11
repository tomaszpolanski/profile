import 'package:profile/material_import.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 700
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              )
            : IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final child in children) Expanded(child: child)
                  ],
                ),
              );
      },
    );
  }
}

enum ScreenSize {
  wide,
  narrow,
}

typedef ResponsiveWidgetBuilder = Widget Function(
    BuildContext context, ScreenSize size);

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    Key key,
    this.snapPoint = 700,
    @required this.builder,
  }) : super(key: key);

  final double snapPoint;
  final ResponsiveWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(
            context,
            constraints.maxWidth < snapPoint
                ? ScreenSize.narrow
                : ScreenSize.wide);
      },
    );
  }
}
