import 'package:flutter/material.dart';
import 'package:moo/components/bubble.dart';
import 'package:moo/components/circular_button.dart';

class SignupInformationPage extends StatefulWidget {
  SignupInformationPage({Key key}) : super(key: key);

  @override
  _SignupInformationPageState createState() => _SignupInformationPageState();
}

class _SignupInformationPageState extends State<SignupInformationPage> {
  final smallBubbleGradient = [Color(0x2bffffff), Color(0x2B808080)];
  final bigBubbleGradient = [Color(0x2bffffff), Color(0x10702B19)];

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
            top: MediaQuery.of(context).size.height * 0.1,
            child: Bubble(
              radius: MediaQuery.of(context).size.width * 0.6,
              colors: bigBubbleGradient,
            ),
          ),
          SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "사용자 정보를\n입력해주세요!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              MediaQuery.of(context).size.width * 0.15),
                          topRight: Radius.circular(
                              MediaQuery.of(context).size.width * 0.15),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircularButton(
                                child: Text("hello"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "가입완료",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
