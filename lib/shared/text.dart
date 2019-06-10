import 'package:flutter/material.dart';

class SmallParagraph extends StatelessWidget {
  const SmallParagraph({
    Key key,
    this.title,
    this.subtitle,
    this.children = const [],
  }) : super(key: key);

  final Widget title;
  final Widget subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .subhead
              .copyWith(fontWeight: FontWeight.bold),
          child: title,
        ),
        DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .subhead
              .copyWith(fontStyle: FontStyle.italic),
          child: subtitle,
        ),
        for (final child in children)
          Row(
            children: <Widget>[
              Text('• '),
              child,
            ],
          )
      ],
    );
  }
}

class BigParagraph extends StatelessWidget {
  const BigParagraph({
    Key key,
    this.title,
    this.subtitle,
    this.children,
  }) : super(key: key);

  final Widget title;
  final Widget subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SmallParagraph(
          title: title,
          subtitle: subtitle,
        ),
        for (final child in children)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '• ',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              child,
            ],
          )
      ],
    );
  }
}
