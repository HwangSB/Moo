import 'package:flutter/material.dart';

class AuctionPriceContainer extends StatefulWidget {
  AuctionPriceContainer({Key key}) : super(key: key);

  @override
  _AuctionPriceContainerState createState() => _AuctionPriceContainerState();
}

class _AuctionPriceContainerState extends State<AuctionPriceContainer> {
  String farmScaleDropdownValue = '1 ~ 49';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0),
              ),
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '평균 ',
                        style: TextStyle(
                          fontFamily: 'SCDream',
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          color: Color(0xFF4E4E4E),
                        ),
                      ),
                      TextSpan(
                        text: '경영비',
                        style: TextStyle(
                          fontFamily: 'SCDream',
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '사육두수',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontWeight: FontWeight.w700,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    DropdownButton(
                      value: farmScaleDropdownValue,
                      items: <String>[
                        '1 ~ 49',
                        '50 ~ 99',
                        '100 ~ 149',
                        '150 ~ 199',
                        '200 ~ 249',
                        '250 ~',
                      ]
                          .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                          .toList(),
                      onChanged: (value) {setState(() {
                        farmScaleDropdownValue = value;
                      });},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
