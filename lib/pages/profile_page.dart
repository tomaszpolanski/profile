import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/droidcon.jpg',
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(child: _ProfileImage()),
            ),
          ),
          _Card(
            title: Text('Nutshell'),
            child: Text(
                '''I'm Tomek; a mobile & web developer with 12 years' experience across Media, FinTech and Geo-Service industries.

I love that programming requires constant curiosity and self-improvement - I get to solve puzzles and learn new things every single day.

I enjoy roles where I can bring my significant experience to the table, but also have the opportunity to learn from excellent peers, and ideally, share my skills with more junior colleagues.'''),
          )
        ],
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          color: Colors.yellowAccent,
          padding: EdgeInsets.symmetric(horizontal: 40),
          margin: EdgeInsets.only(left: 150),
          child: Text(
            'Tomek Polański',
            style: Theme.of(context).textTheme.display2,
          ),
        ),
        Image.asset(
          'images/tomek_round.png',
          width: 160,
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key key,
    this.title,
    this.child,
  }) : super(key: key);

  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DefaultTextStyle(
              style: Theme.of(context).textTheme.title,
              child: title,
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 10,
              color: Theme.of(context).accentColor,
            ),
            SizedBox(height: 10),
            DefaultTextStyle(
              style: Theme.of(context).textTheme.subtitle,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
