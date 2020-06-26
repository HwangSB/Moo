import 'package:flutter/material.dart';
import 'package:moo/components/circular_button.dart';
import 'package:moo/services/rest.dart';

class QuestionPost extends StatefulWidget {
  QuestionPost({Key key}) : super(key: key);

  @override
  _QusetionPostState createState() => _QusetionPostState();
}

enum ChooseTag { yes, no }
enum TagTypes { feed, story, disease, sayang, gaelyang, facility, product, etc }

class _QusetionPostState extends State<QuestionPost> {
  final fabGradient = [Color(0xFF0088FF), Color(0xFF3F44D9)];
  ChooseTag _chooseTag;
  TagTypes _TagTypes;

  bool representtagon = false;
  bool tagwidgeton = false;
  bool titlechange = false;
  bool finishTagSelected = false;

  String titletext = "질문게시글";

  List<Widget> mainview = [];
  List<Widget> tagSelectedList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

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
          controller: titleController,
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
                        value: TagTypes.feed,
                        textStyle: tagTextStyle,
                        groupValue: _TagTypes,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _TagTypes = TagTypes.feed;
                          tagSelectedList.add(widget);
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "축사이야기",
                        value: TagTypes.story,
                        textStyle: tagTextStyle,
                        groupValue: _TagTypes,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _TagTypes = TagTypes.story;
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "질병",
                        value: TagTypes.disease,
                        textStyle: tagTextStyle,
                        groupValue: _TagTypes,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _TagTypes = TagTypes.disease;
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "사양",
                        value: TagTypes.sayang,
                        textStyle: tagTextStyle,
                        groupValue: _TagTypes,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _TagTypes = TagTypes.sayang;
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
                        value: TagTypes.gaelyang,
                        textStyle: tagTextStyle,
                        groupValue: _TagTypes,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _TagTypes = TagTypes.gaelyang;
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "시설",
                        value: TagTypes.facility,
                        textStyle: tagTextStyle,
                        groupValue: _TagTypes,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _TagTypes = TagTypes.facility;
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "제품",
                        value: TagTypes.product,
                        textStyle: tagTextStyle,
                        groupValue: _TagTypes,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _TagTypes = TagTypes.product;
                        }),
                      ),
                    ),
                    Container(
                      width: 85,
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: CircularButton(
                        "기타",
                        value: TagTypes.etc,
                        textStyle: tagTextStyle,
                        groupValue: _TagTypes,
                        multichoice: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                        onTap: () => setState(() {
                          _TagTypes = TagTypes.etc;
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
                  controller: contentController,
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
              //communityDefaultText,
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
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).primaryColor,
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
                            height: 30,
                            child: Center(
                              child: Text(
                                titletext,
                                style: TextStyle(
                                  fontFamily: "SCDream",
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
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
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.autorenew,
                              color: Theme.of(context).primaryColor,
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
                            color: Theme.of(context).primaryColor,
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
              heroTag: "btn1",
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
              heroTag: "btn2",
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
              child: Text("예"),
              onPressed: () {
                RestService.instance.postCommunity('nickname', titleController.text, contentController.text, null);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("아니오"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
