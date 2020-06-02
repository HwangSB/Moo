import 'package:flutter/widgets.dart';

class Bubble extends StatelessWidget {
  final double radius;
  final List<Color> colors;

  Bubble({Key key, this.radius, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2.0,
      height: radius * 2.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
    );
  }
}
