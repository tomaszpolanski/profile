import 'package:flutter/material.dart';
import 'package:profile/shared/appear_sliver.dart';
import 'package:profile/shared/responsive.dart';

class HeaderImageSection extends StatefulWidget {
  const HeaderImageSection({Key key}) : super(key: key);

  @override
  _HeaderImageSectionState createState() => _HeaderImageSectionState();
}

class _HeaderImageSectionState extends State<HeaderImageSection> {
  double percentage = 0;

  @override
  Widget build(BuildContext context) {
    return SliverValueChanged(
      onConstraintsChanged: (_) {},
      onGeometryChanged: (geometry) {
        final percentage = geometry.paintExtent / geometry.maxPaintExtent;
        if (this.percentage != percentage) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              this.percentage = percentage;
            });
          });
        }
      },
      child: ParallaxImageContainer(
        percentage: percentage,
        height: 260,
        image: const AssetImage('assets/droidcon.jpg'),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: _ProfileImage(),
        ),
      ),
    );
  }
}

class ParallaxImageContainer extends StatelessWidget {
  const ParallaxImageContainer({
    Key key,
    @required this.percentage,
    @required this.height,
    @required this.image,
    @required this.child,
  }) : super(key: key);

  final double percentage;
  final double height;
  final ImageProvider image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
          alignment: Alignment(0, -1.0 + percentage),
        ),
      ),
      child: child,
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
