import 'package:eco_ml/charts/barChart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartClass extends StatefulWidget {
  const PieChartClass({Key? key}) : super(key: key);

  @override
  _PieChartClassState createState() => _PieChartClassState();
}

class _PieChartClassState extends State<PieChartClass> {
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
                            fontSize: 20,
                          ),
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
                                    Text(
                                      'Food',
                                      style: TextStyle(
                                        color: Color(0xff4F98A1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
                                    Text(
                                      'Clothing',
                                      style: TextStyle(
                                        color: Color(0xff4F98A1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
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
                                    Text(
                                      'Transportation',
                                      style: TextStyle(
                                        color: Color(0xff4F98A1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
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
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              setState(
                                () {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                    return;
                                  }
                                  touchedIndex = pieTouchResponse
                                      .touchedSection!.touchedSectionIndex;
                                },
                              );
                            },
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          startDegreeOffset: 30,
                          sectionsSpace: 2,
                          centerSpaceRadius: 30,
                          centerSpaceColor: Colors.white,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                  )
                ])),
          ),
        ),
      ]),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 55.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff8DA2FF),
            value: 50,
            title: '50%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffFFB82F),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff3FF367),
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }
}
