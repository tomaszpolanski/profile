import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:profile/pages/profile_page.dart';
import 'package:profile/shared/font_icons.dart';
import 'package:profile/shared/responsive.dart';
import 'package:universal_html/html.dart' as html;

class ContactSection extends StatelessWidget {
  const ContactSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        final child = size == ScreenSize.wide
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: contacts,
              )
            : Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceBetween,
                  alignment: WrapAlignment.spaceAround,
                  spacing: 40,
                  runSpacing: 20,
                  children: contacts,
                ),
              );
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size != ScreenSize.wide ? 0 : 120,
          ),
          child: CardSection(
            title: const Text('Contact'),
            child: child,
          ),
        );
      },
    );
  }
}

final window = html.window;
final contacts = [
  FloatingActionButton(
    elevation: 2,
    tooltip: 'Mail',
    onPressed: () => window.open('mailto:polanski.tomek@gmail.com', 'Mail'),
    child: const Icon(Font.mail),
  ),
  FloatingActionButton(
    elevation: 2,
    tooltip: 'Twitter',
    onPressed: () => window.open('https://twitter.com/tpolansk', 'Twitter'),
    child: const Icon(Font.twitter),
  ),
  FloatingActionButton(
    elevation: 2,
    tooltip: 'Medium',
    onPressed: () => window.open('https://medium.com/@tpolansk', 'Medium'),
    child: const Icon(Font.medium),
  ),
  FloatingActionButton(
    elevation: 2,
    tooltip: 'LinkedIn',
    onPressed: () =>
        window.open('https://www.linkedin.com/in/tomaszpolanski/', 'LinkedIn'),
    child: const Icon(Font.linkedin),
  ),
  FloatingActionButton(
    elevation: 2,
    tooltip: 'Github',
    onPressed: () => window.open('https://github.com/tomaszpolanski', 'Github'),
    child: const Icon(Font.github_circled),
  ),
  FloatingActionButton(
    elevation: 2,
    tooltip: 'Skype',
    onPressed: () => window.open('skype:polanski.tomasz', 'Skype'),
    child: const Icon(Font.skype),
  ),
];
