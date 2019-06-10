import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:profile/pages/profile_page.dart';
import 'package:profile/style.dart' as style;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomek',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: style.yellow,
      ),
      home: ProfilePage(),
    );
  }
}
