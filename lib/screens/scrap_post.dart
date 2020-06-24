import 'package:flutter/material.dart';
import 'package:moo/components/question_card.dart';
import 'package:moo/screens/main_page.dart';

class ScrapPost extends StatefulWidget {
  ScrapPost({Key key}) : super(key: key);

  @override
  _ScrapPostState createState() => _ScrapPostState();
}

List<Widget> viewList = [];

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

class _ScrapPostState extends State<ScrapPost> {
  final fabGradient = [Color(0xFF0088FF), Color(0xFF3F44D9)];
  @override
  Widget build(BuildContext context) {
    viewList = _questionList();

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
                        '스크랩 게시물',
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
