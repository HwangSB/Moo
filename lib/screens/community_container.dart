import 'package:flutter/material.dart';
import 'package:moo/components/circular_button.dart';
import 'package:moo/components/community_card.dart';
import 'package:moo/services/rest.dart';

enum TagType {
  food,
  story,
  disease,
  specification,
  improvement,
  facility,
  product,
  etc
}

class CommunityContainer extends StatefulWidget {
  const CommunityContainer({Key key}) : super(key: key);

  @override
  _CommunityContainerState createState() => _CommunityContainerState();
}

class _CommunityContainerState extends State<CommunityContainer> {
  TagType _tagTypeGroupValue;

  _banner(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '궁금한 점이 있으면 주변 농가에 물어보세요!',
                  style: TextStyle(
                    fontFamily: 'SCDream',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }

  _tags() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            CircularButton(
              '사료',
              value: TagType.food,
              groupValue: _tagTypeGroupValue,
              onTap: () => setState(() {
                _tagTypeGroupValue = TagType.food;
              }),
            ),
            SizedBox(width: 8.0),
            CircularButton(
              '축사이야기',
              value: TagType.story,
              groupValue: _tagTypeGroupValue,
              onTap: () => setState(() {
                _tagTypeGroupValue = TagType.story;
              }),
            ),
            SizedBox(width: 8.0),
            CircularButton(
              '질병',
              value: TagType.disease,
              groupValue: _tagTypeGroupValue,
              onTap: () => setState(() {
                _tagTypeGroupValue = TagType.disease;
              }),
            ),
            SizedBox(width: 8.0),
            CircularButton(
              '사양',
              value: TagType.specification,
              groupValue: _tagTypeGroupValue,
              onTap: () => setState(() {
                _tagTypeGroupValue = TagType.specification;
              }),
            ),
            SizedBox(width: 8.0),
            CircularButton(
              '개량',
              value: TagType.improvement,
              groupValue: _tagTypeGroupValue,
              onTap: () => setState(() {
                _tagTypeGroupValue = TagType.improvement;
              }),
            ),
            SizedBox(width: 8.0),
            CircularButton(
              '시설',
              value: TagType.facility,
              groupValue: _tagTypeGroupValue,
              onTap: () => setState(() {
                _tagTypeGroupValue = TagType.facility;
              }),
            ),
            SizedBox(width: 8.0),
            CircularButton(
              '제품',
              value: TagType.product,
              groupValue: _tagTypeGroupValue,
              onTap: () => setState(() {
                _tagTypeGroupValue = TagType.product;
              }),
            ),
            SizedBox(width: 8.0),
            CircularButton(
              '기타',
              value: TagType.etc,
              groupValue: _tagTypeGroupValue,
              onTap: () => setState(() {
                _tagTypeGroupValue = TagType.etc;
              }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _banner(context),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _tags(),
                  // Row(
                  //   children: <Widget>[
                  //     SizedBox(width: 8.0),
                  //     InkWell(
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Row(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: <Widget>[
                  //             Icon(
                  //               Icons.favorite_border,
                  //               size: 20.0,
                  //               color: Theme.of(context).primaryColor,
                  //             ),
                  //             Text(
                  //               '관심 농가 모아보기',
                  //               style: TextStyle(
                  //                 fontFamily: 'SCDream',
                  //                 fontWeight: FontWeight.w500,
                  //                 fontSize: 14.0,
                  //                 color: Theme.of(context).primaryColor,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       onTap: () {},
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 8.0),
                  FutureBuilder(
                    future: RestService.instance.getCommunityPosts(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      List<PostInfo> postInfo = snapshot.data;
                      if (snapshot.hasData) {
                        return Column(
                          children: List.generate(postInfo.length, (index) {
                            return Column(
                              children: <Widget>[
                                CommunityCard(
                                  writer: postInfo[index].nickName,
                                  summary: postInfo[index].content?.substring(0, 100),
                                  favoriteCount: postInfo[index].likeCount,
                                  commentCount: postInfo[index].commentCount,
                                ),
                                SizedBox(height: 16.0),
                              ],
                            );
                          }),
                        );
                      }
                      return Container();
                    },
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
