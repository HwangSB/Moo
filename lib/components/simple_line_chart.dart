import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample extends StatefulWidget {
  final List<int> prices;

  LineChartSample(this.prices);

  @override
  _LineChartSampleState createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.295,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: LineChart(getLineChartData()),
      ),
    );
  }

  List<FlSpot> getSpots() {
    return [
      FlSpot(0.0, widget.prices[3].toDouble() / 10000.0),
      FlSpot(2.0, widget.prices[2].toDouble() / 10000.0),
      FlSpot(4.0, widget.prices[1].toDouble() / 10000.0),
      FlSpot(6.0, widget.prices[0].toDouble() / 10000.0),
    ];
  }

  LineChartData getLineChartData() {
    final labelStyle = TextStyle(
      fontFamily: 'SCDream',
      fontWeight: FontWeight.w400,
      fontSize: MediaQuery.of(context).size.height * 0.0175,
      color: Colors.white,
    );

    return LineChartData(
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: 3,
      gridData: FlGridData(
        drawVerticalLine: false,
        drawHorizontalLine: false,
      ),
      titlesData: FlTitlesData(
        leftTitles: SideTitles(
          showTitles: true,
          margin: 42.0,
          textStyle: labelStyle,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 2:
                return '20k';
              case 3:
                return '30k';
              case 4:
                return '40k';
              case 5:
                return '50k';
            }
            return '';
          },
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          margin: 8.0,
          textStyle: labelStyle,
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '3주전';
              case 2:
                return '2주전';
              case 4:
                return '1주전';
              case 6:
                return '예측';
            }
            return '';
          },
        ),
      ),
      borderData: FlBorderData(
        border: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          barWidth: 3,
          isCurved: false,
          isStrokeCapRound: true,
          spots: getSpots(),
          colors: [Colors.white],
          dotData: FlDotData(show: false),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
