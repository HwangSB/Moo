import 'package:flutter/material.dart';
import 'package:moo/screens/main_page.dart';
import 'package:moo/screens/mypage.dart';

class FavoriteFarm extends StatefulWidget {
  FavoriteFarm({Key key}) : super(key: key);

  @override
  _FavoriteFarmState createState() => _FavoriteFarmState();
}

class _FavoriteFarmState extends State<FavoriteFarm> {
  final fabGradient = [Color(0xFF0088FF), Color(0xFF3F44D9)];

  List<Widget> viewList = [];

  _farmList() {
    return <Widget>[
      Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.width * 0.12,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width / 15,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    '농가 1',
                    style: TextStyle(
                      fontFamily: "SCDream",
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      color: Color(0xB3000000),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return MyPage();
                  }),
                );
              },
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.1,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '찜한농가해제',
                      style: TextStyle(
                        fontFamily: "SCDream",
                        fontWeight: FontWeight.w300,
                        fontSize: 14.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x29000000),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    viewList = _farmList();

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
                        '찜한 농가',
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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: fabGradient,
          ),
        ),
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
