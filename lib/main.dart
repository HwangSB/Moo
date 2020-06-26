import 'package:flutter/material.dart';
import 'package:moo/components/community_card_v2.dart';
import 'package:moo/components/question_card.dart';
import 'package:moo/screens/main_page.dart';
import 'package:moo/screens/question_board.dart';
import 'package:moo/screens/scrap_post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '여기보소',
      theme: ThemeData(primaryColor: Color.fromARGB(255, 0, 136, 255)),
      home: QuestionBoard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
