import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key key,
    @required this.children,
    @required this.builder,
  }) : super(key: key);

  final List<Widget> children;
  final Widget Function(
    BuildContext context,
    Widget child,
    ScreenSize size,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size =
            constraints.maxWidth < 1140 ? ScreenSize.narrow : ScreenSize.wide;
        final child = size == ScreenSize.narrow
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
        return builder(context, child, size);
      },
    );
  }
}

enum ScreenSize {
  wide,
  narrow,
  tiny,
}

typedef ResponsiveWidgetBuilder = Widget Function(
    BuildContext context, ScreenSize size);

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    Key key,
    this.snapPoint = 1140,
    @required this.builder,
  }) : super(key: key);

  final double snapPoint;
  final ResponsiveWidgetBuilder builder;

  ScreenSize _size(BoxConstraints constraints) {
    if (constraints.maxWidth >= snapPoint) {
      return ScreenSize.wide;
    } else if (constraints.maxWidth > 380) {
      return ScreenSize.narrow;
    } else {
      return ScreenSize.tiny;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(
          context,
          _size(constraints),
        );
      },
    );
  }
}
