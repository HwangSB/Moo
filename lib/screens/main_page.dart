import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 64.0,
              color: Colors.white,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
