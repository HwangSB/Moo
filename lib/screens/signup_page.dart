import 'package:flutter/material.dart';
import 'package:moo/components/bubble.dart';
import 'package:moo/screens/signup_information_page.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
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
            right: MediaQuery.of(context).size.height * -0.1,
            child: Bubble(
              radius: MediaQuery.of(context).size.height * 0.14,
              colors: smallBubbleGradient,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.height * -0.26,
            bottom: MediaQuery.of(context).size.height * 0.1,
            child: Bubble(
              radius: MediaQuery.of(context).size.height * 0.32,
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
                    _signupButton("assets/images/signup_page/kakao-logo.png",
                        "카카오 계정으로 쉬운 시작", kakaoColor),
                    _signupButton("assets/images/signup_page/google-logo.png",
                        "구글 계정으로 쉬운 시작", googleColor)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _signupButton(String name, String text, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: 8.0,
      ),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12.0,
        ),
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              name,
              width: 24,
              height: 24,
            ),
            SizedBox(width: 16.0),
            Text(
              text,
              style:
                  TextStyle(fontFamily: "SCDream", fontWeight: FontWeight.w400),
            ),
          ],
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SignupInformationPage()),
          );
        },
      ),
    );
  }
}
