import 'package:flutter/material.dart';
import 'package:moo/components/circular_button.dart';

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
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Align(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        color:
                            Color(0xFFBCE0FD), //Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6526,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "$title",
                                  style: TextStyle(
                                    fontFamily: "SCDream",
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xCC000000),
                                  ),
                                ),
                                SizedBox(width: 100.0),
                              ],
                            ),
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
                        SizedBox(height: 0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "$contents",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "SCDream",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: Color(0x66000000),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 65,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 0,
                                  vertical: 2,
                                ),
                                child: Text(
                                  "제품",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 65,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 0,
                                  vertical: 2,
                                ),
                                child: Text(
                                  "기타",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                            SizedBox(width: 50.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(
                                  Icons.favorite,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  '$favoriteCount',
                                  style: TextStyle(
                                    fontFamily: 'SCDream',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13.0,
                                    color: Color(0x66000000),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Icon(
                                  Icons.add_comment,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  '$commentCount',
                                  style: TextStyle(
                                    fontFamily: 'SCDream',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13.0,
                                    color: Color(0x66000000),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
