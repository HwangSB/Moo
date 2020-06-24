import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moo/components/community_card_v2.dart';
import 'package:moo/screens/main_page.dart';
import 'package:moo/screens/mypage_edit.dart';
import 'package:moo/components/question_card.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final fabGradient = [Color(0xFF0088FF), Color(0xFF3F44D9)];
  bool checkFree = true;
  bool checkQuestion = false;
  int freePostCount = 5;
  int questPostCount = 5;
  List<Widget> postsview = [];

  _freePost() {
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 85,
              height: 25,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Text(
                  "자유게시글",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontFamily: "SCDream",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () => setState(() {
                  checkFree = true;
                  checkQuestion = false;
                }),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Container(
              width: 85,
              height: 25,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Text(
                  "질문게시글",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0x4D000000),
                    fontFamily: "SCDream",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () => setState(() {
                  checkQuestion = true;
                  checkFree = false;
                }),
              ),
            ),
          ],
        ),
      ),
      CommunityCardV2(
        writer: '지방이네',
        summary: '어쩌구 저쩌구 머라머라머라dddddddddd\n시간을 되돌리자....',
        favoriteCount: 0,
        commentCount: 0,
      ),
      SizedBox(height: 20.0),
    ];
  }

  _questionPost() {
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 85,
              height: 25,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Text(
                  "자유게시글",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0x4D000000),
                    fontFamily: "SCDream",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () => setState(() {
                  checkFree = true;
                  checkQuestion = false;
                }),
              ),
            ),
            SizedBox(width: 10.0),
            Container(
              width: 85,
              height: 25,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Text(
                  "질문게시글",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontFamily: "SCDream",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () => setState(() {
                  checkQuestion = true;
                  checkFree = false;
                }),
              ),
                            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      QuestionCard(
        title: "제목이다",
        contents: "dkdkdkdk",
        favoriteCount: 5,
        commentCount: 5,
      ),
      SizedBox(height: 20.0),
    ];
  }

  _noneFreePost() {
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 85,
              height: 25,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Text(
                  "자유게시글",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontFamily: "SCDream",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () => setState(() {
                  checkFree = true;
                  checkQuestion = false;
                }),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Container(
              width: 85,
              height: 25,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Text(
                  "질문게시글",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0x4D000000),
                    fontFamily: "SCDream",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () => setState(() {
                  checkFree = false;
                  checkQuestion = true;
                }),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "게시글을 등록해주세요!",
            style: TextStyle(
              fontFamily: "SCDream",
              fontWeight: FontWeight.w300,
              color: Color(0x4D000000),
              fontSize: 14,
            ),
          ),
        ),
      ),
      SizedBox(height: 20.0),
    ];
  }

  _noneQuestPost() {
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 85,
              height: 25,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Text(
                  "자유게시글",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0x4D000000),
                    fontFamily: "SCDream",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () => setState(() {
                  checkFree = true;
                  checkQuestion = false;
                }),
              ),
            ),
            SizedBox(width: 10.0),
            Container(
              padding: EdgeInsets.all(0),
              width: 85,
              height: 25,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Text(
                  "질문게시글",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontFamily: "SCDream",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () => setState(() {
                  checkFree = false;
                  checkQuestion = true;
                }),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "게시글을 등록해주세요!",
            style: TextStyle(
              fontFamily: "SCDream",
              fontWeight: FontWeight.w300,
              color: Color(0x4D000000),
              fontSize: 14,
            ),
          ),
        ),
      ),
      SizedBox(height: 20.0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (freePostCount == 0 && checkFree) {
      postsview = _noneFreePost();
    } else if (questPostCount == 0 && checkQuestion) {
      postsview = _noneQuestPost();
    } else if (checkFree && freePostCount > 0) {
      postsview = _freePost();
    } else if (checkQuestion && questPostCount > 0) {
      postsview = _questionPost();
    }

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
                    SizedBox(width: MediaQuery.of(context).size.width - 150),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return MyPageEdit();
                            }),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.notifications_none,
                          color: Theme.of(context).primaryColor,
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
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "나의 프로필",
                  style: TextStyle(
                    fontFamily: "SCDream",
                    color: Theme.of(context).primaryColor,
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
                    color: Theme.of(context).primaryColor,
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
                        color: Theme.of(context).primaryColor,
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
                        color: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 0.5,
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
              Column(
                children: postsview ?? <Widget>[],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
