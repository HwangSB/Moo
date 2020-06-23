import 'package:flutter/material.dart';
import 'package:moo/components/circular_button.dart';

class QuestionPost extends StatefulWidget {
  QuestionPost({Key key}) : super(key: key);

  @override
  _QusetionPostState createState() => _QusetionPostState();
}

enum ChooseTag { yes, no }
enum TagType { feed, story, disease, sayang, gaelyang, facility, product, etc }

class _QusetionPostState extends State<QuestionPost> {
  final mainColor = Color(0xFF0088FF);
  final fabGradient = [Color(0xFF0088FF), Color(0xFF3F44D9)];
  ChooseTag _chooseTag;
  TagType _tagType;

  bool representtagon = false;
  bool tagwidgeton = false;
  bool titlechange = false;
  bool finishTagSelected = false;

  String titletext = "질문게시글";

  List<Widget> mainview = [];
  List<Widget> tagSelectedList = [];

  _tagwidget() {
    return <Widget>[
      Align(
        child: Container(
          padding: EdgeInsets.only(left: 15),
          width: 90,
          child: CircularButton(
            "#태그선택",
            value: 1,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            textStyle: TextStyle(
              fontSize: 12,
            ),
            groupValue: _chooseTag,
            onTap: () => setState(() {
              representtagon = true;
            }),
          ),
        ),
        alignment: Alignment.centerLeft,
      ),
    ];
  }

  _mainWidget() {
    return <Widget>[
      Container(
        padding: EdgeInsets.only(left: 20),
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
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 0.5,
          color: Color(0x66000000),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 5),
        child: FlatButton(
          onPressed: () => setState(() {
            tagwidgeton = true;
          }),
          child: Align(
            child: Text(
              "여기를 눌러 새로운 소식을 농가들과 나눠보세요.",
              style: TextStyle(
                fontFamily: "SCDream",
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Color(0x44000000),
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
    ];
  }

  _representTag() {
    final tagTextStyle = TextStyle(
      fontFamily: "SCDream",
      fontSize: 13.0,
      fontWeight: FontWeight.w300,
    );

    return <Widget>[
      SizedBox(height: 30.0),
      Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Color(0x11000000),
            ),
            child: Column(
              children: <Widget>[
                Align(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, top: 18, bottom: 18),
                    child: Text(
                      "대표태그",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0x66000000),
                        fontFamily: "SCDream",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 15, bottom: 5),
                      child: CircularButton(
                        "사료",
                        value: TagType.feed,
                        textStyle: tagTextStyle,
                        groupValue: _tagType,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _tagType = TagType.feed;
                          tagSelectedList.add(widget);
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "축사이야기",
                        value: TagType.story,
                        textStyle: tagTextStyle,
                        groupValue: _tagType,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _tagType = TagType.story;
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "질병",
                        value: TagType.disease,
                        textStyle: tagTextStyle,
                        groupValue: _tagType,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _tagType = TagType.disease;
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "사양",
                        value: TagType.sayang,
                        textStyle: tagTextStyle,
                        groupValue: _tagType,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _tagType = TagType.sayang;
                        }),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 15, bottom: 5),
                      child: CircularButton(
                        "개량",
                        value: TagType.gaelyang,
                        textStyle: tagTextStyle,
                        groupValue: _tagType,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _tagType = TagType.gaelyang;
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "시설",
                        value: TagType.facility,
                        textStyle: tagTextStyle,
                        groupValue: _tagType,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _tagType = TagType.facility;
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "제품",
                        value: TagType.product,
                        textStyle: tagTextStyle,
                        groupValue: _tagType,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _tagType = TagType.product;
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "기타",
                        value: TagType.etc,
                        textStyle: tagTextStyle,
                        groupValue: _tagType,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _tagType = TagType.etc;
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                reverse: true,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  _tagSelected() {
    return <Widget>[
      SizedBox(height: 15.0),
      Column(
        children: <Widget>[
          Row(
            children: tagSelectedList ?? <Widget>[],
          ),
          Container(
            child: TextField(),
          ),
        ],
      ),
    ];
  }

  _c_mainWidget() {
    return <Widget>[
      Container(
        padding: EdgeInsets.only(left: 5),
        child: FlatButton(
          onPressed: () => setState(() {
            tagwidgeton = true;
          }),
          child: Align(
            child: Text(
              "여기를 눌러 새로운 소식을 농가들과 나눠보세요.",
              style: TextStyle(
                fontFamily: "SCDream",
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Color(0x44000000),
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (tagwidgeton == false && titlechange == false) {
      mainview = _mainWidget();
    } else if (tagwidgeton == true &&
        representtagon == false &&
        titlechange == false) {
      mainview = _mainWidget() + _tagwidget();
    } else if (tagwidgeton == false && titlechange == true) {
      mainview = _c_mainWidget();
    } else if (tagwidgeton == true &&
        representtagon == false &&
        titlechange == true) {
      mainview = _c_mainWidget() + _tagwidget();
    } else if (representtagon == true) {
      mainview = _representTag();
    } else if (finishTagSelected == true) {
      mainview = _tagSelected();
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                    //top: MediaQuery.of(context).size.height * 0.02,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: mainColor,
                      ),
                      onPressed: () {
                        _showDialog();
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            //width: 200,
                            height: 30,
                            child: Center(
                              child: Text(
                                titletext,
                                style: TextStyle(
                                  fontFamily: "SCDream",
                                  fontWeight: FontWeight.w500,
                                  color: mainColor,
                                  fontSize: 20.0,
                                  letterSpacing: 1.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
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
                          IconButton(
                            icon: Icon(
                              Icons.autorenew,
                              color: mainColor,
                            ),
                            onPressed: () => setState(() {
                              if (!titlechange) {
                                titletext = "커뮤니티";
                                titlechange = true;
                                mainview = _c_mainWidget();
                              } else {
                                titletext = "질문게시글";
                                titlechange = false;
                                mainview = _mainWidget();
                              }
                              tagwidgeton = false;
                              representtagon = false;
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    child: Align(
                      alignment: Alignment.centerRight,
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
            Column(
              children: mainview ?? <Widget>[],
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
