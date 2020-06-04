import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Widget child;

  CircularButton({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
      ),
      child: this.child,
    );
  }
}
