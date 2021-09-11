import 'package:eco_ml/charts/barChart.dart';
import 'package:eco_ml/data/database.dart';
import 'package:eco_ml/data/outcomeData.dart';
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
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                              color: Color(0xff4F98A1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 10, left: 10),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(300),
                                          color: Color(0xff8DA2FF)),
                                    ),
                                    Text('Food',
                                        style: TextStyle(
                                          color: Color(0xff4F98A1),
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 10, left: 10),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(300),
                                          color: Color(0xffFFB82F)),
                                    ),
                                    Text('Clothing',
                                        style: TextStyle(
                                          color: Color(0xff4F98A1),
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 10, left: 10),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(300),
                                          color: Color(0xff3FF367)),
                                    ),
                                    Text('Transportation',
                                        style: TextStyle(
                                          color: Color(0xff4F98A1),
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                )
                              ]),
                        )
                      ],
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
                        sectionsSpace: 2,
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
    return List.generate(box.length, (i) {
      final data = box.getAt(i) as Transaction;

      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 55.0 : 50.0;

      if (data.isExpense) {
        return PieChartSectionData(
          color: outcomeData[data.iconId].colorName,
          value: data.amount,
          title: data.amount.toString(),
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      } else if (data.isExpense == false) {
        expenseList.add(data);
        return PieChartSectionData();
      }  else {
        throw Error();
      }
    });
  }
}
