import 'package:flutter/material.dart';

//질문 게시판 메인
class QuestionPost extends StatefulWidget {
  QuestionPost({Key key}) : super(key: key);

  @override
  _QusetionPostState createState() => _QusetionPostState();
}

//autorenew : 아이콘
class _QusetionPostState extends State<QuestionPost> {
  final textColor = Color(0xFF0088FF);
  final fabGradient = [Color(0xFF0088FF), Color(0xFF3F44D9)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: new Icon(
            Icons.close,
            color: textColor,
          ),
          onPressed: () {}, //추가
        ),
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                "질문게시글아아아아",
                style: TextStyle(
                  color: textColor,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            IconButton(
              icon: new Icon(Icons.autorenew, color: textColor),
              onPressed: () {}, //추가
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            width: 50,
            child: FlatButton(
              onPressed: () {
                _showDialog();
              },
              child: Text(
                "완료",
                style: TextStyle(
                  color: textColor,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              padding: EdgeInsets.only(right: 5),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              key: new GlobalKey(),
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration.collapsed(
                hintText: "제목",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 0.5,
              width: 450,
              color: Color(0x66000000),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.0, right: 75.0),
            child: FlatButton(
              onPressed: () {
                //태그 선택하는 버블 생성
              },
              child: Text(
                "여기를 눌러 새로운 소식을 농가들과 나눠보세요용.",
                style: TextStyle(
                  color: Color(0x40000000),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Container>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: fabGradient,
              ),
            ),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.image,
                color: Colors.white,
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: fabGradient,
              ),
            ),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.photo_camera,
                color: Colors.white,
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("글쓰기를 종료하시겠습니까?"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {},
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
        });
  }
}