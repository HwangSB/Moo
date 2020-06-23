import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moo/components/circular_button.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final mainColor = Color(0xFF0088FF);
  final fabGradient = [Color(0xFF0088FF), Color(0xFF3F44D9)];

  int _currentIndex = 0;
  final List<Widget> _children = [/*메인, 시세, 커뮤니티*/ MyPage()];

  _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: mainColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width - 150),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: mainColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.notifications_none,
                          color: mainColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width / 15,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: mainColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "나의 프로필",
                  style: TextStyle(
                    fontFamily: "SCDream",
                    color: mainColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 40,
                ),
                child: Text(
                  "경기도 부천",
                  style: TextStyle(
                    fontFamily: "SCDream",
                    color: mainColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  bottom: 10,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.07,
                      height: MediaQuery.of(context).size.width * 0.07,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mainColor,
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile/cow.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "60 ~ 100 두",
                        style: TextStyle(
                          fontFamily: "SCDream",
                          color: Color(0xFF5B5B5B),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  bottom: 10,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(0),
                      width: MediaQuery.of(context).size.width * 0.07,
                      height: MediaQuery.of(context).size.width * 0.07,
                      child: LayoutBuilder(builder: (context, constraint) {
                        return Icon(
                          Icons.call,
                          color: Colors.white,
                          size: constraint.biggest.height,
                        );
                      }),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mainColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "010-1111-1111",
                        style: TextStyle(
                          fontFamily: "SCDream",
                          color: Color(0xFF5B5B5B),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 0.35, //0.5
                  decoration: BoxDecoration(
                    color: Color(0xFFBCE0FD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x29000000),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  bottom: 15,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                    child: Text(
                      "농장소개",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "SCDream",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 0.1, //0.5
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "우리 농장은 ~곳이에요.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5B5B5B),
                      fontFamily: "SCDream",
                      fontWeight: FontWeight.w300,
                    ),
                    maxLines: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x29000000),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: fabGradient,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => {},
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            title: Text("aa"),
            icon: Icon(
              Icons.home,
              color: Colors.transparent,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("aa"),
            icon: Icon(
              Icons.insert_chart,
              color: Color(0xFFB2B2B2),
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("aa"),
            icon: Icon(
              Icons.dashboard,
              color: Color(0xFFB2B2B2),
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("aa"),
            icon: Icon(
              Icons.person,
              color: Color(0xFFB2B2B2),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
