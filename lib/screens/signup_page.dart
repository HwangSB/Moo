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
          Positioned(
            top: MediaQuery.of(context).size.height * -0.1,
            right: MediaQuery.of(context).size.width * -0.2,
            child: Bubble(
              radius: MediaQuery.of(context).size.width * 0.25,
              colors: smallBubbleGradient,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * -0.5,
            bottom: MediaQuery.of(context).size.height * 0.1,
            child: Bubble(
              radius: MediaQuery.of(context).size.width * 0.6,
              colors: bigBubbleGradient,
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _signupButton("카카오 계정으로 쉬운 시작", kakaoColor),
                    _signupButton("구글 계정으로 쉬운 시작", googleColor)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _signupButton(String text, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: 8.0,
      ),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
          vertical: 12.0,
        ),
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.message),
            Text(text),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
