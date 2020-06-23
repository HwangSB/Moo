import 'package:flutter/material.dart';
import 'package:moo/screens/main_page.dart';
import 'package:moo/screens/mypage_edit.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 136, 255)
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}