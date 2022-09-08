import 'package:eco_ml/charts/barChart.dart';
import 'package:eco_ml/data/database.dart';
import 'package:eco_ml/data/incomeData.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hive/hive.dart';

class PieChartClass extends StatefulWidget {
  const PieChartClass({
    Key? key,
  }) : super(key: key);

  @override
  _PieChartClassState createState() => _PieChartClassState();
}

class _PieChartClassState extends State<PieChartClass> {
  var expenseList = [];
  final box = Hive.box('transactions');
  final incomeBox = Hive.box('income');
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        BarChartSample2(),
        AspectRatio(
          aspectRatio: 3 / 2,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Card(
                elevation: 5,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 0, right: 20),
                            child: Text(
                              'Categories',
                              style: TextStyle(
                                  color: Color(0xff4F98A1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Wrap(
                              children: List.generate(box.length, (index) {
                            final data = box.getAt(index) as Transaction;
                            if (!data.isExpense &&
                                data.datatime.day == DateTime.now().day) {
                              return Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 10, left: 10),
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: incomeData[data.iconId]
                                              .colorName),
                                      child: Icon(
                                          incomeData[data.iconId].iconName,
                                          size: 13,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: 30),
                                    Text(incomeData[data.iconId].title,
                                        style: TextStyle(
                                          color: Color(0xff4F98A1),
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(height: 30),
                                  ],
                                ),
                              );
                            } else {
                              return Text('');
                            }
                          })),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 0.5,
                      child: PieChart(PieChartData(
                        pieTouchData: PieTouchData(touchCallback:
                            (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        startDegreeOffset: 30,
                        sectionsSpace: 0,
                        centerSpaceRadius: 30,
                        centerSpaceColor: Colors.white,
                        sections: showingSections(),
                      )),
                    ),
                  )
                ])),
          ),
        ),
      ]),
    );
  }

  List<PieChartSectionData> showingSections() {
    double totalSumIncome = 0.0;
    // ignore: unused_local_variable
    double totalSumExpense = 0.0;
    for (var i = 0; i < box.length; i++) {
      final data = box.getAt(i) as Transaction;
      if (data.isExpense) {
        totalSumExpense += data.amount;
      } else if (!data.isExpense) {
        totalSumIncome += data.amount;
      }
    }
    return List.generate(box.length, (i) {
      final data = box.getAt(i) as Transaction;

      // double income = incomeBox.get(0);

      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 55.0 : 50.0;
      double value = (data.amount / totalSumIncome) * 100.0;
      if (!data.isExpense && data.datatime.day == DateTime.now().day) {
        return PieChartSectionData(
          color: incomeData[data.iconId].colorName,
          value: value,
          title: '${value.ceilToDouble()}%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      } else {
        return PieChartSectionData(value: 0);
      }
    });
  }
}
