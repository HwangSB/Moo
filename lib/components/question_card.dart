import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String title;
  final String contents;
  final Widget tag;
  final num favoriteCount;
  final num commentCount;

  const QuestionCard({
    Key key,
    this.title,
    this.contents,
    this.tag,
    this.favoriteCount,
    this.commentCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 10,
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Color(0xFFBCE0FD), //Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                ),
              ),
              Column(

                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "$title",
                        style: TextStyle(
                          fontFamily: "SCDream",
                          fontWeight: FontWeight.w500,
                          color: Color(0xCC000000),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      PopupMenuButton(
                        //onSelected: choiceAction,
                        color: Colors.white,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text(
                              "수정하기",
                              style: TextStyle(
                                fontFamily: 'SCDream',
                                fontWeight: FontWeight.w300,
                                color: Color(0x66000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            value: "edit",
                          ),
                          PopupMenuItem(
                            child: Text(
                              "삭제하기",
                              style: TextStyle(
                                fontFamily: 'SCDream',
                                fontWeight: FontWeight.w300,
                                color: Color(0x66000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            value: "delete",
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "$contents",
                    style: TextStyle(
                      fontFamily: "SCDream",
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Color(0x66000000),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
