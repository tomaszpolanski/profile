import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:profile/shared/appear_sliver.dart';

class VisibilityBuilder extends StatelessWidget {
  const VisibilityBuilder({
    @required this.builder,
    Key key,
  }) : super(key: key);

  final Widget Function(BuildContext context, double percentage) builder;

  @override
  Widget build(BuildContext context) {
    return GeometryBuilder<double>(
      converter: (geometry) => geometry.paintExtent / geometry.maxPaintExtent,
      builder: builder,
    );
  }
}

class GeometryBuilder<T> extends StatefulWidget {
  const GeometryBuilder({
    Key key,
    @required this.converter,
    @required this.builder,
  }) : super(key: key);

  final T Function(SliverGeometry geometry) converter;
  final Widget Function(BuildContext context, T value) builder;

  @override
  _GeometryBuilderState<T> createState() => _GeometryBuilderState<T>();
}

class _GeometryBuilderState<T> extends State<GeometryBuilder<T>> {
  T _value;

  @override
  Widget build(BuildContext context) {
    return SliverValueChanged(
      onConstraintsChanged: (_) {},
      onGeometryChanged: (geometry) {
        final value = widget.converter(geometry);
        if (_value != value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              _value = value;
            });
          });
        }
      },
      child: widget.builder(context, _value),
    );
  }
}
