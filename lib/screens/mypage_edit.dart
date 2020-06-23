import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moo/components/circular_button.dart';
import 'package:moo/screens/main_page.dart';
import 'package:moo/screens/mypage.dart';

class MyPageEdit extends StatefulWidget {
  MyPageEdit({Key key}) : super(key: key);

  @override
  _MyPageEditState createState() => _MyPageEditState();
}

enum LocationTag { gangwon, gyunggi, cb, cn, jb, jn }

class _MyPageEditState extends State<MyPageEdit> {
  final TextEditingController _textController = new TextEditingController();
  String dropdownValue = '1~49두';

  final containers = {
    'myprofile': MyPage(),
  };
  LocationTag _locationTag;
  Widget currentContainer;
  
  _goMyPage(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return MyPage();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tagTextStyle = TextStyle(
      fontFamily: "SCDream",
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
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
                        onPressed: ()  {
                          _goMyPage();
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
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
                child: Icon(
                  Icons.image,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width / 15,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                        border: Border.all(
                          color: Color(0x33707070),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          "중복확인",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SCDream",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0x05000000),
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "사육두수 변경",
                          style: TextStyle(
                            fontFamily: "SCDream",
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.12,
                                height:
                                    MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/profile/cow.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Container(
                                width: 150,
                                alignment: Alignment.center,
                                child: DropdownButton(
                                  value: dropdownValue,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 30.0,
                                  elevation: 10,
                                  style: TextStyle(
                                    fontFamily: "SCDream",
                                    fontWeight: FontWeight.w500,
                                    color: Color(0x99000000),
                                    fontSize: 18.0,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: [
                                    '1~49두',
                                    '50~99두',
                                    '100~149두',
                                    '150~199두',
                                    '200~249두',
                                    '250두~'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "농장번호 변경",
                          style: TextStyle(
                            fontFamily: "SCDream",
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(0),
                              width: MediaQuery.of(context).size.width * 0.12,
                              height: MediaQuery.of(context).size.width * 0.12,
                              child:
                                  LayoutBuilder(builder: (context, constraint) {
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
                              padding: EdgeInsets.only(left: 10.0),
                              child: Container(
                                width: 200,
                                height: 40,
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7),
                                  ),
                                  border: Border.all(
                                    color: Color(0x33707070),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 80,
                              padding: EdgeInsets.only(left: 10),
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "변경",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "SCDream",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 0.0,
                  right: 0.0,
                  bottom: 20,
                ),
                color: Color(0x05000000),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.95, /////
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.366,
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
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
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          top: 18,
                          bottom: 15,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 100,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 6),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.25,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          top: 18,
                          bottom: 15,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 120,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 6),
                            child: Text(
                              "농장위치",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 120,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: CircularButton(
                              "강원도",
                              value: LocationTag.gangwon,
                              textStyle: tagTextStyle,
                              groupValue: _locationTag,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 6),
                              onTap: () => setState(() {
                                _locationTag = LocationTag.gangwon;
                              }),
                            ),
                          ),
                          Container(
                            width: 120,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: CircularButton(
                              "경기도",
                              value: LocationTag.gyunggi,
                              textStyle: tagTextStyle,
                              groupValue: _locationTag,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 6),
                              onTap: () => setState(() {
                                _locationTag = LocationTag.gyunggi;
                              }),
                            ),
                          ),
                          Container(
                            width: 120,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: CircularButton(
                              "충청북도",
                              value: LocationTag.cb,
                              textStyle: tagTextStyle,
                              groupValue: _locationTag,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 6),
                              onTap: () => setState(() {
                                _locationTag = LocationTag.cb;
                              }),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 120,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: CircularButton(
                              "충청남도",
                              value: LocationTag.cn,
                              textStyle: tagTextStyle,
                              groupValue: _locationTag,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 6),
                              onTap: () => setState(() {
                                _locationTag = LocationTag.cn;
                              }),
                            ),
                          ),
                          Container(
                            width: 120,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: CircularButton(
                              "전라북도",
                              value: LocationTag.jb,
                              textStyle: tagTextStyle,
                              groupValue: _locationTag,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 6),
                              onTap: () => setState(() {
                                _locationTag = LocationTag.jb;
                              }),
                            ),
                          ),
                          Container(
                            width: 120,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: CircularButton(
                              "전라남도",
                              value: LocationTag.jn,
                              textStyle: tagTextStyle,
                              groupValue: _locationTag,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 6),
                              onTap: () => setState(() {
                                _locationTag = LocationTag.jn;
                              }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: FlatButton(
                  onPressed: () {
                    //프로필로 이동
                  },
                  child: Text(
                    "수정완료",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SCDream",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
