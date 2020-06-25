import 'package:flutter/material.dart';

class CommunityCardV2 extends StatelessWidget {
  final String writer;
  final String summary;
  final num favoriteCount;
  final num commentCount;

  const CommunityCardV2({
    Key key,
    this.writer,
    this.summary,
    this.favoriteCount,
    this.commentCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 38.0,
                            height: 38.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(width: 12.0),
                          Text(
                            '$writer',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '3분 전',
                        style: TextStyle(
                          fontFamily: 'SCDream',
                          fontWeight: FontWeight.w200,
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '$summary',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: Colors.black87,
                            ),
                          ),
                          Container(
                            width: 25,
                            padding: EdgeInsets.only(right: 0),
                            //alignment: Alignment.centerRight,
                            child: PopupMenuButton(
                              onSelected: (value) {
                                if (value == "edit") {
                                } else if (value == "delete") {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Text("삭제하시겠습니까?"),
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
                              },
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
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFBCE0FD),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFBCE0FD),
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.0),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFBCE0FD),
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.0),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFBCE0FD),
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        size: 16.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '$favoriteCount',
                        style: TextStyle(
                          fontFamily: 'SCDream',
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Icon(
                        Icons.mode_comment,
                        size: 16.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '$commentCount',
                        style: TextStyle(
                          fontFamily: 'SCDream',
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 0.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.favorite_border,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          '좋아요',
                          style: TextStyle(
                            fontFamily: 'SCDream',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.add_comment,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          '댓글달기',
                          style: TextStyle(
                            fontFamily: 'SCDream',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.bookmark_border,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          '스크랩',
                          style: TextStyle(
                            fontFamily: 'SCDream',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    final snackbar = SnackBar(
                      content: Text('스크랩 되었습니다'),
                      action: SnackBarAction(
                        label: '취소',
                        onPressed: () {},
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
