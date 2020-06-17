import 'package:flutter/material.dart';

//질문 게시판 메인
class QuestionPost extends StatefulWidget {
  QuestionPost({Key key}) : super(key: key);

  @override
  _QusetionPostState createState() => _QusetionPostState();
}

//autorenew : 아이콘
class _QusetionPostState extends State<QuestionPost> {
  final mainColor = Color(0xFF0088FF);
  final fabGradient = [Color(0xFF0088FF), Color(0xFF3F44D9)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    left: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: mainColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: 13,
                    left: MediaQuery.of(context).size.width * 0.32,
                    child: Container(
                      child: Text(
                        "질문게시글",
                        style: TextStyle(
                          fontFamily: "SCDream",
                          fontWeight: FontWeight.w500,
                          color: mainColor,
                          fontSize: 20.0,
                          letterSpacing: 1.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.55,
                    child: IconButton(
                      icon: Icon(
                        Icons.autorenew,
                        color: mainColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    width: 70,
                    right: 0,
                    child: FlatButton(
                      onPressed: () {
                        _showDialog();
                      },
                      child: Text(
                        "완료",
                        style: TextStyle(
                          fontFamily: "SCDream",
                          fontWeight: FontWeight.w300,
                          fontSize: 18.0,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ),
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
            Positioned(
              top: MediaQuery.of(context).size.height * 0.08,
              left: MediaQuery.of(context).size.width * 0.03,
              width: 250,
              child: TextField(
                style: TextStyle(
                  fontFamily: "SCDream",
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
                decoration: InputDecoration.collapsed(
                    hintText: "제목",
                    hintStyle: TextStyle(
                      color: Color(0xFF999999),
                    )),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width * 0.95,
                  color: Color(0x66000000),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              child: FlatButton(
                onPressed: () {
                  //태그 선택하는 버블 생성
                },
                child: Text(
                  "여기를 눌러 새로운 소식을 농가들과 나눠보세요.",
                  style: TextStyle(
                    fontFamily: "SCDream",
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Color(0x40000000),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
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
              padding: EdgeInsets.only(
                bottom: 10,
              ),
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
      },
    );
  }
}
