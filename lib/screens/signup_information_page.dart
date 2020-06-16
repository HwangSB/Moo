import 'package:flutter/material.dart';
import 'package:moo/components/bubble.dart';
import 'package:moo/components/circular_button.dart';

enum FarmType { onGoing, onSchedule }
enum FarmScale { s1, s2, s3, s4, s5, s6 }
enum FarmLocation {
  gangwon,
  gyeonggi,
  chungbuk,
  chungnam,
  gyeongbuk,
  gyeongnam,
  jeonbuk,
  jeonnam,
  jeju
}

class SignupInformationPage extends StatefulWidget {
  SignupInformationPage({Key key}) : super(key: key);

  @override
  _SignupInformationPageState createState() => _SignupInformationPageState();
}

class _SignupInformationPageState extends State<SignupInformationPage> {
  final smallBubbleGradient = [Color(0x2bffffff), Color(0x2B808080)];
  final bigBubbleGradient = [Color(0x2bffffff), Color(0x10702B19)];

  FarmType _farmTypeGroupValue;
  FarmScale _farmScaleGroupValue;
  FarmLocation _farmLocationGroupValue;

  List<Widget> informationFields = [];

  _personalInformation() {
    final headTextStyle = TextStyle(
      fontFamily: "SCDream",
      color: Theme.of(context).primaryColor,
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
    );

    final buttonTextStyle = TextStyle(
      fontFamily: "SCDream",
      color: Colors.white,
      fontWeight: FontWeight.w300,
    );

    final textFieldTextStyle = TextStyle(
      fontFamily: "SCDream",
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w300,
    );

    return <Widget>[
      SizedBox(
        height: 34.0,
      ),
      Row(
        children: <Widget>[
          Text(
            "닉네임",
            style: headTextStyle,
          ),
        ],
      ),
      SizedBox(height: 14.0),
      Row(
        children: <Widget>[
          Expanded(child: _textField(textFieldTextStyle)),
          SizedBox(width: 16.0),
          SizedBox(
            width: 100.0,
            child: CircularButton(
              "중복확인",
              value: true,
              groupValue: true,
              textStyle: buttonTextStyle,
              onTap: () {},
            ),
          ),
        ],
      ),
      SizedBox(
        height: 34.0,
      ),
      Row(
        children: <Widget>[
          Text(
            "휴대전화",
            style: headTextStyle,
          ),
        ],
      ),
      SizedBox(height: 14.0),
      Row(
        children: <Widget>[
          Expanded(child: _textField(textFieldTextStyle)),
          SizedBox(width: 16.0),
          SizedBox(
            width: 100.0,
            child: CircularButton(
              "입력",
              value: true,
              groupValue: true,
              textStyle: buttonTextStyle,
              onTap: () {},
            ),
          ),
        ],
      ),
    ];
  }

  _farmInformation() {
    final headTextStyle = TextStyle(
      fontFamily: "SCDream",
      color: Theme.of(context).primaryColor,
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
    );

    final bodyTextStyle = TextStyle(
      fontFamily: "SCDream",
      color: Theme.of(context).primaryColor,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    );

    final tagTextStyle = TextStyle(
      fontFamily: "SCDream",
      fontSize: 10.0,
      fontWeight: FontWeight.w300,
    );

    return <Widget>[
      SizedBox(
        height: 34.0,
      ),
      Row(
        children: <Widget>[
          Text(
            "농가정보",
            style: headTextStyle,
          ),
        ],
      ),
      SizedBox(height: 14.0),
      Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.0,
                ),
              ),
            ),
            child: Text(
              "사육두수",
              style: bodyTextStyle,
            ),
          ),
        ],
      ),
      SizedBox(height: 14.0),
      Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: CircularButton(
                  "1 ~ 50",
                  value: FarmScale.s1,
                  groupValue: _farmScaleGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmScaleGroupValue = FarmScale.s1;
                  }),
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: CircularButton(
                  "50 ~ 99",
                  value: FarmScale.s2,
                  groupValue: _farmScaleGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmScaleGroupValue = FarmScale.s2;
                  }),
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: CircularButton(
                  "100 ~ 149",
                  value: FarmScale.s3,
                  groupValue: _farmScaleGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmScaleGroupValue = FarmScale.s3;
                  }),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: CircularButton(
                  "150 ~ 199",
                  value: FarmScale.s4,
                  groupValue: _farmScaleGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmScaleGroupValue = FarmScale.s4;
                  }),
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: CircularButton(
                  "200 ~ 249",
                  value: FarmScale.s5,
                  groupValue: _farmScaleGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmScaleGroupValue = FarmScale.s5;
                  }),
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: CircularButton(
                  "250 ~ ",
                  value: FarmScale.s6,
                  groupValue: _farmScaleGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmScaleGroupValue = FarmScale.s6;
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 14.0),
      Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.0,
                ),
              ),
            ),
            child: Text(
              "농가위치",
              style: bodyTextStyle,
            ),
          ),
        ],
      ),
      SizedBox(height: 14.0),
      Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: CircularButton(
                  "강원도",
                  value: FarmLocation.gangwon,
                  groupValue: _farmLocationGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmLocationGroupValue = FarmLocation.gangwon;
                  }),
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: CircularButton(
                  "경기도",
                  value: FarmLocation.gyeonggi,
                  groupValue: _farmLocationGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmLocationGroupValue = FarmLocation.gyeonggi;
                  }),
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: CircularButton(
                  "충청북도",
                  value: FarmLocation.chungbuk,
                  groupValue: _farmLocationGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmLocationGroupValue = FarmLocation.chungbuk;
                  }),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: CircularButton(
                  "충청남도",
                  value: FarmLocation.chungnam,
                  groupValue: _farmLocationGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmLocationGroupValue = FarmLocation.chungnam;
                  }),
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: CircularButton(
                  "전라북도",
                  value: FarmLocation.jeonbuk,
                  groupValue: _farmLocationGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmLocationGroupValue = FarmLocation.jeonbuk;
                  }),
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: CircularButton(
                  "전라남도",
                  value: FarmLocation.jeonnam,
                  groupValue: _farmLocationGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmLocationGroupValue = FarmLocation.jeonnam;
                  }),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: CircularButton(
                  "경상북도",
                  value: FarmLocation.gyeongbuk,
                  groupValue: _farmLocationGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmLocationGroupValue = FarmLocation.gyeongbuk;
                  }),
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: CircularButton(
                  "경상남도",
                  value: FarmLocation.gyeongnam,
                  groupValue: _farmLocationGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmLocationGroupValue = FarmLocation.gyeongnam;
                  }),
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: CircularButton(
                  "제주도",
                  value: FarmLocation.jeju,
                  groupValue: _farmLocationGroupValue,
                  textStyle: tagTextStyle,
                  onTap: () => setState(() {
                    _farmLocationGroupValue = FarmLocation.jeju;
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    ];
  }

  _textField(TextStyle style) {
    return TextField(
      controller: TextEditingController(),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300], width: 1.0),
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width,
          ),
        ),
      ),
      style: style,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_farmTypeGroupValue == FarmType.onGoing) {
      informationFields = _personalInformation() + _farmInformation();
    }
    else if (_farmTypeGroupValue == FarmType.onSchedule) {
      informationFields = _personalInformation();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 280.0,
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -64.0,
                    right: -64.0,
                    child: Bubble(
                      radius: 98.0,
                      colors: smallBubbleGradient,
                    ),
                  ),
                  Positioned(
                    left: -250.0,
                    top: 84.0,
                    child: Bubble(
                      radius: 236.0,
                      colors: bigBubbleGradient,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "사용자 정보를\n입력해주세요!",
                                  style: TextStyle(
                                    fontFamily: "SCDream",
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(64.0),
                                topRight: Radius.circular(64.0),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.0,
                              vertical: 42.0,
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircularButton(
                                      "축산농가",
                                      value: FarmType.onGoing,
                                      groupValue: _farmTypeGroupValue,
                                      onTap: () => setState(() {
                                        _farmTypeGroupValue = FarmType.onGoing;
                                      }),
                                    ),
                                    SizedBox(width: 16.0),
                                    CircularButton(
                                      "예비농가",
                                      value: FarmType.onSchedule,
                                      groupValue: _farmTypeGroupValue,
                                      onTap: () => setState(() {
                                        _farmTypeGroupValue =
                                            FarmType.onSchedule;
                                      }),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: informationFields ?? <Widget>[],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Theme.of(context).primaryColor,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: Text(
                            "가입완료",
                            style: TextStyle(
                              fontFamily: "SCDream",
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
