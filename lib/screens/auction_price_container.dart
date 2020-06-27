import 'package:flutter/material.dart';
import 'package:moo/components/simple_line_chart.dart';
import 'package:moo/services/rest.dart';

class AuctionPriceContainer extends StatefulWidget {
  AuctionPriceContainer({Key key}) : super(key: key);

  @override
  _AuctionPriceContainerState createState() => _AuctionPriceContainerState();
}

class _AuctionPriceContainerState extends State<AuctionPriceContainer> {
  String farmScaleDropdownValue = '1 ~ 19';
  
  @override
  Widget build(BuildContext context) {
    int weekPrice = 0;
    int predictPrice = 0;
    List<int> chartData = [0, 0, 0, 0];
    int managementPrice = 0;
    int feedPrice = 0;

    return FutureBuilder(
      future: RestService.instance.getAuctionPrice(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          AuctionPriceResult auctionPriceResult = snapshot.data;
          predictPrice = auctionPriceResult.predictPrice;
          weekPrice = auctionPriceResult.predictPrice -
              auctionPriceResult.weekPrices[0].weekPrice;
          chartData = [
            auctionPriceResult.predictPrice,
            auctionPriceResult.weekPrices[0].weekPrice,
            auctionPriceResult.weekPrices[1].weekPrice,
            auctionPriceResult.weekPrices[2].weekPrice,
          ];
          int cowCountIndex = 0;
          switch (farmScaleDropdownValue) {
            case '1 ~ 19':
              cowCountIndex = 0;
              break;
            case '20 ~ 49':
              cowCountIndex = 1;
              break;
            case '50 ~ 99':
              cowCountIndex = 2;
              break;
            case '100 ~ ':
              cowCountIndex = 3;
              break;
          }
          managementPrice =
              auctionPriceResult.managementPrices[cowCountIndex].managePrice;
          feedPrice =
              auctionPriceResult.managementPrices[cowCountIndex].feedPrice;
        }
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
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '전주대비 ',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0175,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: '$weekPrice',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              color: Color(0xFF194187),
                            ),
                          ),
                          TextSpan(
                            text: ' 원',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0175,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '$predictPrice',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w800,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.05,
                              color: Color(0xFF194187),
                            ),
                          ),
                          TextSpan(
                            text: ' 원',
                            style: TextStyle(
                                fontFamily: 'SCDream',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                color: Colors.white),
                          ),
                          TextSpan(
                            text: ' (kg)',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              color: Color(0x61FFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    LineChartSample(chartData),
                  ],
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
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              color: Color(0xFF4E4E4E),
                            ),
                          ),
                          TextSpan(
                            text: '경영비',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
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
                          '사육두수',
                          style: TextStyle(
                            fontFamily: 'SCDream',
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        DropdownButton(
                          value: farmScaleDropdownValue,
                          items: <String>[
                            '1 ~ 19',
                            '20 ~ 49',
                            '50 ~ 99',
                            '100 ~ ',
                          ]
                              .map<DropdownMenuItem<String>>(
                                  (value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              farmScaleDropdownValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 64.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '$managementPrice',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w800,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.05,
                              color: Color(0xFF194187),
                            ),
                          ),
                          TextSpan(
                            text: ' 원',
                            style: TextStyle(
                                fontFamily: 'SCDream',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                color: Color(0xFF4E4E4E)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '평균 ',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              color: Color(0xFF4E4E4E),
                            ),
                          ),
                          TextSpan(
                            text: '사료비',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 64.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '$feedPrice',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w800,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.05,
                              color: Color(0xFF194187),
                            ),
                          ),
                          TextSpan(
                            text: ' 원',
                            style: TextStyle(
                                fontFamily: 'SCDream',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                color: Color(0xFF4E4E4E)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48.0),
            ],
          ),
        );
      },
    );
  }
}
