import 'package:flutter/material.dart';
import 'package:moo/components/circular_button.dart';

class CommunityDetailPage extends StatefulWidget {
  final String writer;
  final String contents;
  final num favoriteCount;
  final num commentCount;

  CommunityDetailPage({
    Key key,
    this.writer,
    this.contents,
    this.favoriteCount,
    this.commentCount,
  }) : super(key: key);

  @override
  _CommunityDetailPageState createState() => _CommunityDetailPageState();
}

class _CommunityDetailPageState extends State<CommunityDetailPage> {
  _appBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 64.0,
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back, size: 32.0),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _tags() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: <Widget>[
          CircularButton(
            '사료',
            value: true,
            groupValue: true,
          ),
          SizedBox(width: 8.0),
          CircularButton(
            '질병',
            value: true,
            groupValue: true,
          ),
          SizedBox(width: 8.0),
          CircularButton(
            '기타',
            value: true,
            groupValue: true,
          ),
        ],
      ),
    );
  }

  _textField(TextStyle style) {
    return TextField(
      controller: TextEditingController(),
      decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(8.0),
          border: InputBorder.none,
          hintText: '댓글을 입력하세요...'),
      style: style,
    );
  }

  _detailCard(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            '${widget.writer}',
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
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${widget.contents}',
                          style: TextStyle(
                            fontFamily: 'SCDream',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  _tags(),
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
                        '${widget.favoriteCount}',
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
                        '${widget.commentCount}',
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

  _comment(String writer, String comment, String date, num favoriteCount) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
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
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 50.0),
                Expanded(
                  child: Text(
                    '$comment',
                    style: TextStyle(
                      fontFamily: 'SCDream',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$date',
                  style: TextStyle(
                    fontFamily: 'SCDream',
                    fontWeight: FontWeight.w200,
                    fontSize: 10.0,
                    color: Colors.black45,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite_border,
                                color: Theme.of(context).primaryColor,
                                size: 18.0,
                              ),
                              Text(
                                '$favoriteCount',
                                style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.reply,
                                color: Theme.of(context).primaryColor,
                                size: 18.0,
                              ),
                              Text(
                                '답글달기',
                                style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textFieldTextStyle = TextStyle(
      fontFamily: "SCDream",
      fontWeight: FontWeight.w300,
      fontSize: 14.0,
      color: Colors.black,
    );

    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: Builder(
        builder: (context) => SafeArea(
          child: Column(
            children: <Widget>[
              _appBar(context),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 16.0),
                      _detailCard(context),
                      Divider(height: 0.0),
                      Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Column(
                          children: <Widget>[
                            _comment('소!리질러~', '댓글' * 20,
                                DateTime.now().toString(), 10),
                            Divider(height: 0.0),
                            _comment('소!리질러~', '댓글' * 20,
                                DateTime.now().toString(), 10),
                            Divider(height: 0.0),
                            _comment('소!리질러~', '댓글' * 20,
                                DateTime.now().toString(), 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0x66D2D2D2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Material(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xB5C7C7C7),
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: _textField(textFieldTextStyle),
                              ),
                              InkResponse(
                                child: Icon(
                                  Icons.send,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
