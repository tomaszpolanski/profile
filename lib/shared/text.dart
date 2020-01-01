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
              .copyWith(fontWeight: FontWeight.bold, height: 1.2),
          child: title,
        ),
        DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .subhead
              .copyWith(fontStyle: FontStyle.italic, height: 1.2),
          child: subtitle,
        ),
        for (final child in children)
          DefaultTextStyle(
            style: Theme.of(context).textTheme.subhead.copyWith(height: 1.2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('• '),
                Expanded(child: child),
              ],
            ),
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
                    .copyWith(fontWeight: FontWeight.bold, height: 1.2),
              ),
              Expanded(child: child),
            ],
          )
      ],
    );
  }
}
