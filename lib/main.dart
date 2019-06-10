import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:profile/pages/profile_page.dart';

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
        primarySwatch: Colors.yellow,
      ),
      home: ProfilePage(),
    );
  }
}
