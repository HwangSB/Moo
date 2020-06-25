import 'package:flutter/material.dart';
import 'package:moo/screens/main_page.dart';

class UserGuide extends StatefulWidget {
  UserGuide({Key key}) : super(key: key);

  @override
  _UserGuideState createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  final fabGradient = [Color(0xFF0088FF), Color(0xFF3F44D9)];
  bool isSwitched = false;

  List<Widget> viewList = [];
  List<dynamic> guideList = [];

  _guideList() {
    return <Widget>[
      SizedBox(height: 20.0),
      Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            ExpansionTile(
              title: Text('어떤 서비스 인가요?'),
              children: <Widget>[
                ListTile(
                  title: Text(
                    '답변 준비 중 입니다.',
                    style: TextStyle(
                      fontFamily: "SCDream",
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('광고를 올려도 되나요?'),
              children: <Widget>[
                ListTile(
                  title: Text(
                    '답변 준비 중 입니다.',
                    style: TextStyle(
                      fontFamily: "SCDream",
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('인기 게시물은 어떻게 선정 되나요?'),
              children: <Widget>[
                ListTile(
                  title: Text(
                    '답변 준비 중 입니다.',
                    style: TextStyle(
                      fontFamily: "SCDream",
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    viewList = _guideList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return MainPage();
                          }),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        '이용안내',
                        style: TextStyle(
                          fontFamily: "SCDream",
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 50.0),
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color(0x0F000000),
                  ),
                ),
              ),
            ),
            Column(children: viewList ?? <Widget>[]),
          ],
        ),
      ),
    );
  }
}
