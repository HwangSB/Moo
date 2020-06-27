import 'package:flutter/material.dart';
import 'package:moo/components/bubble.dart';
import 'package:moo/screens/main_page.dart';
import 'package:moo/screens/signup_page.dart';
import 'package:moo/services/rest.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final smallBubbleGradient = [Color(0x2bffffff), Color(0x2B808080)];
  final bigBubbleGradient = [Color(0x2bffffff), Color(0x10702B19)];

  handleSignIn(SignResult result) {
    if (result == null) {
      Navigator.of(context).pushReplacement(
        FadePageRoute(page: SignupPage()),
      );
      return;
    }

    Navigator.of(context).pushReplacement(
      FadePageRoute(page: MainPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    Future<SignResult> result = RestService.instance.signIn(SnsType.kakao, 'test');
    result.then((value) => handleSignIn(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
          ],
        ),
      ),
    );
  }
}

class FadePageRoute extends PageRouteBuilder {
  final Widget page;

  FadePageRoute({this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
