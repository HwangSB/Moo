import 'package:flutter/material.dart';
import 'package:moo/components/bubble.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final smallBubbleGradient = [Color(0x2bffffff), Color(0x2B808080)];
  final bigBubbleGradient = [Color(0x2bffffff), Color(0x10702B19)];

  final kakaoColor = Color(0xFFFAE300);
  final googleColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Bubble(
            radius: 50.0,
            colors: smallBubbleGradient,
          ),
          Bubble(
            radius: 100.0,
            colors: bigBubbleGradient,
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MaterialButton(
                    color: kakaoColor,
                    child: Text("카카오 계정으로 쉬운 시작"),
                    onPressed: () {},
                  ),
                  MaterialButton(
                    color: googleColor,
                    child: Text("구글 계정으로 쉬운 시작"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
