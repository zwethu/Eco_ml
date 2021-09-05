import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffFFC0CE);
  final double width = 10;

  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shadowColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Color(0xff53fdd7)),
                          ),
                          Text('Income',
                              style: TextStyle(
                                color: Color(0xff4F98A1),
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Color(0xffFFC0CE)),
                          ),
                          Text('Expense',
                              style: TextStyle(
                                color: Color(0xff4F98A1),
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                 SizedBox(
                        height: 10,
                      ),

                Expanded(
                  child: BarChart(
                    BarChartData(
                      maxY: 20,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              String weekDay;
                              switch (group.x.toInt()) {
                                case 0:
                                  weekDay = 'Monday';
                                  break;
                                case 1:
                                  weekDay = 'Tuesday';
                                  break;
                                case 2:
                                  weekDay = 'Wednesday';
                                  break;
                                case 3:
                                  weekDay = 'Thursday';
                                  break;
                                case 4:
                                  weekDay = 'Friday';
                                  break;
                                case 5:
                                  weekDay = 'Saturday';
                                  break;
                                case 6:
                                  weekDay = 'Sunday';
                                  break;
                                default:
                                  throw Error();
                              }
                              return BarTooltipItem(
                                weekDay + '\n',
                                TextStyle(
                                  color: Color(0xff4F98A1),
                                  fontSize: 15,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: (rod.y - 1).toString(),
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              );
                            }),
                        touchCallback: (FlTouchEvent event, barTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                barTouchResponse == null ||
                                barTouchResponse.spot == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex =
                                barTouchResponse.spot!.touchedBarGroupIndex;
                          });
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: SideTitles(showTitles: false),
                        topTitles: SideTitles(showTitles: false),
                        bottomTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (context, value) => const TextStyle(
                              color: Color(0xff4F98A1),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          margin: 5,
                          getTitles: (double value) {
                            switch (value.toInt()) {
                              case 0:
                                return 'Mon';
                              case 1:
                                return 'Tue';
                              case 2:
                                return 'Wed';
                              case 3:
                                return 'Thu';
                              case 4:
                                return 'Fri';
                              case 5:
                                return 'Sat';
                              case 6:
                                return 'Sun';
                              default:
                                return '';
                            }
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingGroups(),
                      gridData: FlGridData(show: false),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y1,
    double y2, {
    bool isTouched = false,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: isTouched ? y1 + 1 : y1,
        colors: [leftBarColor],
        width: width,
      ),
      BarChartRodData(
        y: isTouched ? y2 + 1 : y2,
        colors: [rightBarColor],
        width: width,
      ),
    ]);
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, 12, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 16, 12, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 18, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 20, 16, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 17, 6, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 19, 1.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 10, 1.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });
}
