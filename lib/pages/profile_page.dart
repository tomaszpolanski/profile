import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:profile/pages/profile/section/contact_section.dart';
import 'package:profile/pages/profile/section/knowledge_section.dart';
import 'package:profile/shared/responsive.dart';
import 'package:profile/shared/text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 260,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/droidcon.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: _ProfileImage(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ResponsiveWidget(
              builder: (context, child, size) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size == ScreenSize.narrow ? 0 : 120,
                  ),
                  child: child,
                );
              },
              children: <Widget>[
                const CardSection(
                  title: Text('Nutshell'),
                  child: Text('''
I'm Tomek; a mobile & web developer with 13 years' experience across Media, FinTech and Geo-Service industries.

I love that programming requires constant curiosity and self-improvement - I get to solve puzzles and learn new things every single day.

I enjoy roles where I can bring my significant experience to the table, but also have the opportunity to learn from excellent peers, and ideally, share my skills with more junior colleagues.'''),
                ),
                CardSection(
                  title: const Text('Experience'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
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
                                "Basler's InsurTech venture (pre-launch) - JavaScript/TypeScript"),
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
                                  "extended Nokia's C++ map engine to integrate with Windows 8 C# environment"),
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
          ),
          const KnowledgeSection(),
          SliverToBoxAdapter(
            child: ResponsiveWidget(
              builder: (context, child, size) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size == ScreenSize.narrow ? 0 : 120,
                  ),
                  child: child,
                );
              },
              children: <Widget>[
                CardSection(
                  title: const Text('Human Languages'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text('Fluent English'),
                      Text('Native Polish'),
                      Text('Basic German'),
                    ],
                  ),
                ),
                CardSection(
                  title: const Text('Education & Certification'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text('2013 CSM – Certified Scrum Master'),
                      Text(
                          '2004 – 2009 Polish-Japanese Institute of Information '
                          'Technology Warsaw System and network programming'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: ContactSection(),
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
          'assets/tomek_round.png',
          width: 160,
        );
        final name = Material(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              size == ScreenSize.tiny ? 'Tomek' : 'Tomek Polański',
              style: Theme.of(context).textTheme.headline5.copyWith(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        );
        return size != ScreenSize.tiny
            ? Row(
                children: <Widget>[
                  image,
                  const SizedBox(width: 20),
                  Expanded(child: name),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  image,
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: name,
                  ),
                ],
              );
      },
    );
  }
}

class CardSection extends StatelessWidget {
  const CardSection({
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
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
              child: title,
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 10,
              color: Theme.of(context).accentColor,
            ),
            const SizedBox(height: 10),
            DefaultTextStyle(
              style:
                  Theme.of(context).textTheme.subtitle1.copyWith(height: 1.2),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
