import 'package:flutter/material.dart';
import 'package:moo/components/bubble.dart';

class MainContainer extends StatelessWidget {
  final smallBubbleGradient = [
    Color(0x2bffffff),
    Color(0x2B808080),
  ];
  final bigBubbleGradient = [
    Color(0x2bffffff),
    Color(0x10702B19),
  ];
  num fluctuatingPrice;
  num weekPrice;

  MainContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                color: Theme.of(context).primaryColor,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: -38.0,
                          left: -38.0,
                          child: Bubble(
                            radius: 64.0,
                            colors: smallBubbleGradient,
                          ),
                        ),
                        Positioned(
                          top: -64.0,
                          right: -64.0,
                          child: Bubble(
                            radius: 98.0,
                            colors: bigBubbleGradient,
                          ),
                        ),
                        Positioned(
                          bottom: -64.0,
                          right: -64.0,
                          child: Bubble(
                            radius: 98.0,
                            colors: smallBubbleGradient,
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.05,
                          top: MediaQuery.of(context).size.height * 0.02,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${DateTime.now().month}월 ${DateTime.now().day}일 시세",
                                    style: TextStyle(
                                      fontFamily: 'SCDream',
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.025,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text.rich(
                                    TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '전주대비',
                                          style: TextStyle(
                                            fontFamily: 'SCDream',
                                            fontWeight: FontWeight.w400,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0175,
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '$fluctuatingPrice',
                                          style: TextStyle(
                                            fontFamily: 'SCDream',
                                            fontWeight: FontWeight.w700,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Color(0xFF194187),
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' 만원',
                                          style: TextStyle(
                                            fontFamily: 'SCDream',
                                            fontWeight: FontWeight.w400,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0175,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 34.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.125,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IgnorePointer(
                      child: Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '약  ',
                              style: TextStyle(
                                fontFamily: 'SCDream',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: '$weekPrice',
                              style: TextStyle(
                                fontFamily: 'SCDream',
                                fontWeight: FontWeight.w800,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.05,
                                color: Color(0xFF194187),
                              ),
                            ),
                            TextSpan(
                              text: ' 만원',
                              style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontWeight: FontWeight.w700,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: ' (kg)',
                              style: TextStyle(
                                fontFamily: 'SCDream',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                color: Color(0x61FFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 6.0,
                              color: Colors.black12)
                        ],
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Row(
            children: <Widget>[
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Text(
                '이번주 HOT 3 게시글',
                style: TextStyle(
                  fontFamily: 'SCDream',
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.height * 0.0225,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
