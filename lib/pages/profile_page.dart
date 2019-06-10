import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/shared/text.dart';

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
          ),
          _Card(
            title: Text('Experience'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SmallParagraph(
                  title: Text(
                      '2017 - Present - Groupon: Senior Flutter Developer'),
                  subtitle: Text('Berlin'),
                ),
                SizedBox(height: 10),
                BigParagraph(
                  title: Text('2011 - 2017 Futurice'),
                  subtitle: Text('Digital agency, Berlin, Helsinki'),
                  children: <Widget>[
                    SmallParagraph(
                      title: Text('2017 - Friday.de: React.js Developer'),
                      subtitle: Text(
                          'Basler\'s InsurTech venture (pre-launch) - JavaScript/TypeScript'),
                      children: <Widget>[
                        Text(
                            'launching B2C product with web-based React.js solution'),
                        Text(
                            'leading Test-Driven Development (TDD) principles for stability and scalability in DACH launch'),
                        Text(
                            'voluntarily automated financial statement processing tools, to enable first revenue'),
                      ],
                    ),
                    SmallParagraph(
                      title: Text(
                          '2015 - 2016 upday for Samsung: Senior Android Developer'),
                      subtitle: Text(
                          'News/media aggregation app, native Android - Java'),
                      children: <Widget>[
                        Text(
                            'rebuilt and relaunched the product using Reactive and Continuous Integration (CI) approach'),
                        Text(
                            'wrote, launched and scaled first revenue-enabling features'),
                        Text(
                            'coached junior developers in TDD and Reactive Programming'),
                      ],
                    ),
                    SmallParagraph(
                      title: Text(
                          '2011 - 2014 HERE (Nokia): Senior Windows Developer'),
                      subtitle: Text('Native desktop maps application - C#'),
                      children: <Widget>[
                        Text(
                            'collaborated with Microsoft on R&D, compatibility and global launch'),
                        Text(
                            'extended Nokia\'s C++ map engine to integrate with Windows 8 C# environment'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SmallParagraph(
                  title: Text('2007- 2010 Psiloc: Symbian C++ Developer'),
                  subtitle: Text('Digital agency, Warsaw'),
                ),
              ],
            ),
          ),
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
        padding: const EdgeInsets.all(20),
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
              style: Theme.of(context).textTheme.subhead,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
