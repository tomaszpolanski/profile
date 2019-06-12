import 'package:profile/shared/font_icons.dart';
import 'package:profile/shared/html.dart' as html;
import 'package:profile/shared/material_import.dart';
import 'package:profile/shared/responsive.dart';
import 'package:profile/shared/text.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final window = html.window;
    final contacts = [
      FloatingActionButton(
        elevation: 2,
        tooltip: 'Mail',
        onPressed: () => window.open('mailto:polanski.tomek@gmail.com', 'Mail'),
        child: Icon(Font.mail),
      ),
      FloatingActionButton(
        elevation: 2,
        tooltip: 'Twitter',
        onPressed: () => window.open('https://twitter.com/tpolansk', 'Twitter'),
        child: Icon(Font.twitter),
      ),
      FloatingActionButton(
        elevation: 2,
        tooltip: 'Medium',
        onPressed: () => window.open('https://medium.com/@tpolansk', 'Medium'),
        child: Icon(Font.medium),
      ),
      FloatingActionButton(
        elevation: 2,
        tooltip: 'LinkedIn',
        onPressed: () => window.open(
            'https://www.linkedin.com/in/tomaszpolanski/', 'LinkedIn'),
        child: Icon(Font.linkedin),
      ),
      FloatingActionButton(
        elevation: 2,
        tooltip: 'Github',
        onPressed: () =>
            window.open('https://github.com/tomaszpolanski', 'Github'),
        child: Icon(Font.github_circled),
      ),
      FloatingActionButton(
        elevation: 2,
        tooltip: 'Skype',
        onPressed: () => window.open('skype:polanski.tomasz', 'Skype'),
        child: Icon(Font.skype),
      ),
    ];
    final knowledge = [
      KnowledgeCircle(
        percentage: 1,
        child: Text('Dart'),
      ),
      KnowledgeCircle(
        percentage: 0.95,
        child: Text('Kotlin'),
      ),
      KnowledgeCircle(
        percentage: 0.9,
        child: Text('Java'),
      ),
      KnowledgeCircle(
        percentage: 0.8,
        child: Text('C#'),
      ),
      KnowledgeCircle(
        percentage: 0.8,
        child: Text('F#'),
      ),
      KnowledgeCircle(
        percentage: 0.6,
        child: Text('JS'),
      ),
    ];

    return Material(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Container(
            height: 260,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/droidcon.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: _ProfileImage(),
            ),
          ),
          ResponsiveWidget(
            builder: (context, child, size) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size == ScreenSize.narrow ? 0 : 120,
                ),
                child: child,
              );
            },
            children: <Widget>[
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
                    SizedBox(height: 10, width: 10),
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
                          subtitle:
                              Text('Native desktop maps application - C#'),
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
          ResponsiveBuilder(
            snapPoint: 1140,
            builder: (context, size) {
              final child = size == ScreenSize.wide
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: knowledge,
                    )
                  : Center(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.spaceBetween,
                        alignment: WrapAlignment.spaceAround,
                        spacing: 40,
                        runSpacing: 26,
                        children: knowledge,
                      ),
                    );
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size != ScreenSize.wide ? 0 : 120,
                ),
                child: _Card(
                  title: Text('Programming Languages'),
                  child: child,
                ),
              );
            },
          ),
          ResponsiveWidget(
            builder: (context, child, size) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size == ScreenSize.narrow ? 0 : 120,
                ),
                child: child,
              );
            },
            children: <Widget>[
              _Card(
                title: Text('Human Languages'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Fluent English'),
                    Text('Native Polish'),
                    Text('Basic German'),
                  ],
                ),
              ),
              _Card(
                title: Text('Education & Certification'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('2013 CSM – Certified Scrum Master'),
                    Text('2004 – 2009 Polish-Japanese Institute of Information '
                        'Technology Warsaw System and network programming'),
                  ],
                ),
              ),
            ],
          ),
          ResponsiveBuilder(
            snapPoint: 1140,
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
                child: _Card(
                  title: Text('Contact'),
                  child: child,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        final image = Image.asset(
          'images/tomek_round.png',
          width: 160,
        );
        final name = Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(
            size == ScreenSize.tiny ? 'Tomek' : 'Tomek Polański',
            style: Theme.of(context).textTheme.headline.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
        );
        return size != ScreenSize.tiny
            ? Row(
                children: <Widget>[
                  image,
                  SizedBox(width: 20),
                  Expanded(child: name),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  image,
                  Transform.translate(
                    offset: Offset(0, -20),
                    child: name,
                  ),
                ],
              );
      },
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
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
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
              style: Theme.of(context).textTheme.subhead.copyWith(height: 1.2),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class KnowledgeCircle extends StatefulWidget {
  const KnowledgeCircle({
    Key key,
    this.percentage,
    this.child,
  }) : super(key: key);

  final double percentage;
  final Widget child;

  @override
  _KnowledgeCircleState createState() => _KnowledgeCircleState();
}

class _KnowledgeCircleState extends State<KnowledgeCircle>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                    .headline
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
