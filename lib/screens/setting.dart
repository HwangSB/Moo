import 'package:flutter/material.dart';
import 'package:moo/screens/main_page.dart';
import 'package:moo/screens/mypage.dart';

class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final fabGradient = [Color(0xFF0088FF), Color(0xFF3F44D9)];
  bool isSwitched = false;

  List<Widget> viewList = [];

  _settingList() {
    return <Widget>[
      SizedBox(height: 20.0),
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "알림",
                  style: TextStyle(
                    fontFamily: "SCDReam",
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: Color(0xB3000000),
                  ),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: Theme.of(context).primaryColor,
                  activeColor: Colors.white,
                ),
              ],
            ),
            Divider(height: 0.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text("로그아웃 하시겠습니까?"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return MainPage();
                                  }),
                                );
                              },
                              child: Text("예"),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("아니오"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "로그아웃",
                    style: TextStyle(
                      fontFamily: "SCDReam",
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      color: Color(0xB3000000),
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 0.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text("탈퇴하시겠습니까?"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return MainPage();
                                  }),
                                );
                              },
                              child: Text("예"),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("아니오"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "탈퇴하기",
                    style: TextStyle(
                      fontFamily: "SCDReam",
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      color: Color(0xB3000000),
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 0.0),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    viewList = _settingList();

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
                        '설정',
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
