import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:profile/pages/profile_page.dart';
import 'package:profile/shared/responsive.dart';
import 'package:profile/shared/visibility_builder.dart';

class KnowledgeSection extends StatelessWidget {
  const KnowledgeSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VisibilityBuilder(
      builder: (context, percentage) {
        return ResponsiveBuilder(
          builder: (context, size) {
            const _knowledge = [
              _Knowledge('Dart', 1),
              _Knowledge('Kotlin', 0.95),
              _Knowledge('Java', 0.9),
              _Knowledge('C#', 0.8),
              _Knowledge('F#', 0.8),
              _Knowledge('JS', 0.6),
            ];
            final children = _knowledge
                .mapIndexed(
                  (index, item) => _KnowledgeCircle(
                    visible: percentage >= (index + 1) / _knowledge.length,
                    percentage: item.percentage,
                    child: Text(item.name),
                  ),
                )
                .toList(growable: false);
            final child = size == ScreenSize.wide
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: children,
                  )
                : Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.spaceBetween,
                      alignment: WrapAlignment.spaceAround,
                      spacing: 40,
                      runSpacing: 26,
                      children: children,
                    ),
                  );
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size != ScreenSize.wide ? 0 : 120,
              ),
              child: CardSection(
                title: const Text('Programming Languages'),
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}

class _Knowledge {
  const _Knowledge(this.name, this.percentage);

  final String name;
  final double percentage;
}

class _KnowledgeCircle extends StatefulWidget {
  const _KnowledgeCircle({
    Key key,
    @required this.percentage,
    @required this.visible,
    @required this.child,
  }) : super(key: key);

  final double percentage;
  final bool visible;
  final Widget child;

  @override
  _KnowledgeCircleState createState() => _KnowledgeCircleState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('percentage', percentage));
  }
}

class _KnowledgeCircleState extends State<_KnowledgeCircle>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(_KnowledgeCircle oldWidget) {
    if (widget.visible != oldWidget.visible) {
      if (widget.visible) {
        _controller.forward();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 130,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return CircularProgressIndicator(
                value: widget.percentage * _controller.value,
                strokeWidth: 18,
              );
            },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension IterableEx<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T) mapper) sync* {
    int i = 0;
    for (final value in this) {
      yield mapper(i++, value);
    }
  }
}
