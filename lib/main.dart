import 'package:flutter/material.dart';
import 'package:moo/screens/mypage.dart';
import 'package:moo/screens/question_post.dart';
import 'package:moo/screens/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 136, 255)
      ),
      home: QuestionPost(),
      debugShowCheckedModeBanner: false,
    );
  }
}