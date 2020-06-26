import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:moo/screens/auction_price_container.dart';
import 'package:moo/screens/favorite_farm.dart';
import 'package:moo/screens/main_container.dart';
import 'package:moo/screens/community_container.dart';
import 'package:moo/screens/question_post.dart';
import 'package:moo/screens/mypage.dart';
import 'package:moo/screens/scrap_post.dart';
import 'package:moo/screens/setting.dart';
import 'package:moo/screens/user_guide.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _innerDrawerKey = GlobalKey<InnerDrawerState>();
  final fabGradient = [
    Color(0xFF0088FF),
    Color(0xFF3F44D9),
  ];
  final containers = {
    'main': MainContainer(),
    'auction': AuctionPriceContainer(),
    'community': CommunityContainer(),
    'mypage': MyPage(),
  };

  String appBarText;
  Widget currentContainer;

  @override
  void initState() {
    super.initState();
    appBarText = '홈';
    currentContainer = containers['main'];
  }

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
                icon: Icon(Icons.menu, size: 32.0),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  _innerDrawerKey.currentState
                      .toggle(direction: InnerDrawerDirection.start);
                },
              ),
              Text(
                '$appBarText',
                style: TextStyle(
                  fontFamily: 'SCDream',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                icon: Icon(Icons.notifications_none, size: 32.0),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  _innerDrawerKey.currentState
                      .toggle(direction: InnerDrawerDirection.end);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _innerDrawerItem(BuildContext context, IconData icon, String text) {
    final itemTextStyle = TextStyle(
      fontFamily: 'SCDream',
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).primaryColor,
    );

    return SizedBox(
      height: 64.0,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Icon(icon, size: 24.0, color: Theme.of(context).primaryColor),
              SizedBox(width: 8.0),
              Text(text, style: itemTextStyle),
            ],
          ),
        ),
        onTap: () {
          if (text == '스크랩한 게시글') {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ScrapPost();
              }),
            );
          } else if (text == '찜한농가') {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return FavoriteFarm();
              }),
            );
          } else if (text == '설정') {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return Setting();
              }),
            );
          } else if (text == '이용안내') {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return UserGuide();
              }),
            );
          }
        },
      ),
    );
  }

  _leftInnerDrawer(BuildContext context) {
    final innerDrawerTitleTextStyle = TextStyle(
      fontFamily: 'SCDream',
      fontSize: 22.0,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).primaryColor,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 64.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("메뉴", style: innerDrawerTitleTextStyle),
                  ),
                ],
              ),
            ),
            Divider(height: 0.0),
            // _innerDrawerItem(context, Icons.bookmark, "스크랩한 게시글"),
            // Divider(height: 0.0),
            // _innerDrawerItem(context, Icons.favorite, "찜한농가"),
            Divider(height: 0.0),
            _innerDrawerItem(context, Icons.settings, "설정"),
            Divider(height: 0.0),
            _innerDrawerItem(context, Icons.question_answer, "이용안내"),
          ],
        ),
      ),
    );
  }

  _rightInnerDrawer(BuildContext context) {
    final innerDrawerTitleTextStyle = TextStyle(
      fontFamily: 'SCDream',
      fontSize: 22.0,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).primaryColor,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 64.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("알림", style: innerDrawerTitleTextStyle),
                  ),
                ],
              ),
            ),
            Divider(height: 0.0),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
      key: _innerDrawerKey,
      boxShadow: [],
      colorTransitionChild: Colors.transparent,
      colorTransitionScaffold: Colors.transparent,
      onTapClose: true,
      swipe: false,
      leftChild: _leftInnerDrawer(context),
      rightChild: _rightInnerDrawer(context),
      scaffold: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xFFEFEFEF),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _appBar(context),
              Expanded(
                child: currentContainer,
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: fabGradient,
            ),
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.add,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return QuestionPost();
                }),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 64.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.home),
                  onPressed: () {
                    setState(() {
                      appBarText = '홈';
                      currentContainer = containers['main'];
                    });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.table_chart),
                  onPressed: () {
                    setState(() {
                      appBarText = '시세';
                      currentContainer = containers['auction'];
                    });
                  },
                ),
                SizedBox(
                  width: 30.0,
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.dashboard),
                  onPressed: () {
                    setState(() {
                      appBarText = '커뮤니티';
                      currentContainer = containers['community'];
                    });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.person),
                  onPressed: () {
                    setState(() {
                      appBarText = '';
                      currentContainer = containers['mypage'];
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
