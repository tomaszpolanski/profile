import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      title: 'Tomek Polański',
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoOverscroll(),
          child: child,
        );
      },
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        brightness: Brightness.light,
        primarySwatch: style.yellow,
      ),
      home: ProfilePage(),
    );
  }
}

class NoOverscroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) =>
      child;
}
