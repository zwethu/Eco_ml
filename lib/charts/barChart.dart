import 'package:eco_ml/data/database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class BarChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final box = Hive.box('transactions');
  final incomeBox = Hive.box('income');
  final outcomeBox = Hive.box('outcome');

  List<Map<String, double>> get groupedTransactions {
    return List.generate(7, (index) {
      final iterateIndex = 6 - index;
      final weekDay = DateTime.now().subtract(Duration(days: iterateIndex));
      double totalSumExpense = 0.0;
      var totalSumIncome = 0.0;

      for (var i = 0; i < box.length; i++) {
        final data = box.getAt(i) as Transaction;
        if (data.datatime.day == weekDay.day &&
            data.datatime.month == weekDay.month &&
            data.isExpense) {
          totalSumExpense += data.amount;
        } else if (data.datatime.day == weekDay.day &&
            data.datatime.month == weekDay.month &&
            !data.isExpense) {
          totalSumIncome += data.amount;
        }
      }
      return {
        'amount': totalSumExpense,
        'amount2': totalSumIncome,
      };
    });
  }

  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffFFC0CE);
  final double width = 10;
  double value1 = 7;

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
                Expanded(
                  child: BarChart(
                    BarChartData(
                      maxY: 20,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                            tooltipMargin: 5.0,
                            tooltipPadding: EdgeInsets.all(0),
                            tooltipBgColor: Colors.transparent,
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              // String weekDay;
                              // switch (group.x.toInt()) {
                              //   case 0:
                              //     weekDay = 'Monday';
                              //     break;
                              //   case 1:
                              //     weekDay = 'Tuesday';
                              //     break;
                              //   case 2:
                              //     weekDay = 'Wednesday';
                              //     break;
                              //   case 3:
                              //     weekDay = 'Thursday';
                              //     break;
                              //   case 4:
                              //     weekDay = 'Friday';
                              //     break;
                              //   case 5:
                              //     weekDay = 'Saturday';
                              //     break;
                              //   case 6:
                              //     weekDay = 'Sunday';
                              //     break;
                              //   default:
                              //     throw Error();
                              // }
                              // return BarTooltipItem(
                              //   weekDay + '\n',
                              //   TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 15,
                              //   ),
                              //   children: <TextSpan>[
                              //     TextSpan(
                              //       text: (rod.y - 1).toString(),
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 14,
                              //         fontWeight: FontWeight.w500,
                              //       ),
                              //     ),
                              //   ],
                              // );
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
                          getTitles: (value1) {
                            final value2 = 6 - value1;
                            final weekDay = DateTime.now()
                                .subtract(Duration(days: value2.toInt()));

                            return DateFormat.E().format(weekDay).toString();
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

  List<BarChartGroupData> showingGroups() {
    var totalSumIncome = 0.0;
    double totalSumExpense = 0.0;
    for (var index = 0; index < box.length; index++) {
      final data = box.getAt(index) as Transaction;
      if (data.isExpense) {
        totalSumExpense += data.amount;
      } else if (!data.isExpense) {
        totalSumIncome += data.amount;
      }
    }
    return List.generate(7, (i) {
      var smth = groupedTransactions[i].values.first;
      var expenseValue = (smth / (totalSumIncome + totalSumExpense)) * 30;
      var smth2 = groupedTransactions[i].values.last;

      var incomeValue = (smth2 / (totalSumExpense + totalSumIncome)) * 30;

      return makeGroupData(i, incomeValue, expenseValue,
          isTouched: i == touchedIndex);
    });
  }
}