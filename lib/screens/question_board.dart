import 'package:flutter/material.dart';
import 'package:moo/components/question_card.dart';
import 'package:moo/screens/main_page.dart';
import 'package:moo/screens/question_post.dart';

class QuestionBoard extends StatefulWidget {
  QuestionBoard({Key key}) : super(key: key);

  @override
  _QuestionBoardState createState() => _QuestionBoardState();
}

class _QuestionBoardState extends State<QuestionBoard> {
  final fabGradient = [Color(0xFF0088FF), Color(0xFF3F44D9)];

  List<Widget> contents = [];
  List<Widget> viewList = [];
  bool normalFarm = true;

  _questionList() {
    return <Widget>[
      QuestionCard(
        title: "하나",
        contents: "내용1",
        favoriteCount: 1,
        commentCount: 1,
        checkMy: 0,
      ),
      SizedBox(height: 2.0),
      QuestionCard(
        title: "둘",
        contents: "내용2",
        favoriteCount: 2,
        commentCount: 2,
        checkMy: 0,
      ),
      SizedBox(height: 2.0),
    ];
  }

  _normalFarm(BuildContext context) {
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "일반농가",
                      style: TextStyle(
                        fontFamily: "SCDream",
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () => setState(() {
                      normalFarm = true;
                      //contents = _normalFarm(context);
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "예비 축산인",
                      style: TextStyle(
                        fontFamily: "SCDream",
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: Color(0x66000000),
                      ),
                    ),
                    onPressed: () => setState(() {
                      normalFarm = false;
                      //contents = _preFarmer(context);
                    }),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.05,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "질문등록",
                      style: TextStyle(
                        fontFamily: "SCDream",
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return QuestionPost();
                        },
                      ),
                    );
                  },
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  _preFarmer(BuildContext context) {
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "일반농가",
                      style: TextStyle(
                        fontFamily: "SCDream",
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: Color(0x66000000),
                      ),
                    ),
                    onPressed: () => setState(() {
                      normalFarm = true;
                      //contents = _normalFarm(context);
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "예비 축산인",
                      style: TextStyle(
                        fontFamily: "SCDream",
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () => setState(() {
                      normalFarm = false;
                      //contents = _preFarmer(context);
                    }),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.05,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "질문등록",
                      style: TextStyle(
                        fontFamily: "SCDream",
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return QuestionPost();
                        },
                      ),
                    );
                  },
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    viewList = _questionList();
    if (normalFarm) {
      contents = _normalFarm(context);
    } else if (!normalFarm) {
      contents = _preFarmer(context);
    }

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
                        '질문게시판',
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(width: 5),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0x66707070),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.13,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                  ),
                  SizedBox(width: 5)
                ],
              ),
            ),
            Column(children: contents ?? <Widget>[]),
            SingleChildScrollView(
              child: Column(children: viewList ?? <Widget>[]),
            ),
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
