import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartProfileTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartProfileTwoState();
}

class PieChartProfileTwoState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.white,
          elevation: 5,
          shadowColor: Colors.grey,
          child: Row(
            children: <Widget>[
              const SizedBox(
                height: 28,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Color(0xffff6670)),
                        ),
                        Text('Expense',
                            style: TextStyle(
                                color: Color(0xff4F98A1),
                                fontWeight: FontWeight.bold,
                                fontSize: 20))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 3),
                          height: 21,
                          width: 21,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Color(0xff7dff9d)),
                        ),
                        Text('Income',
                            style: TextStyle(
                                color: Color(0xff4F98A1),
                                fontWeight: FontWeight.bold,
                                fontSize: 21))
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 0.5,
                  child: PieChart(
                    PieChartData(
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
                        startDegreeOffset: 180,
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 1,
                        centerSpaceRadius: 0,
                        sections: showingSections()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        final isTouched = i == touchedIndex;
        final opacity = isTouched ? 1.0 : 0.6;
        double size =  50;
        double value1 = 80;
        double value2 = 20;
        final double radius1 = value1 < value2
            ? isTouched
                ? 70
                : 65
            : isTouched
                ? 65
                : 65;
        final double radius2 = value2 < value1
            ? isTouched
                ? 70
                : 65
            : isTouched
                ? 65
                : 65;

        final color0 = const Color(0xffff828a);
        final color1 = const Color(0xff7dff9d);

        final color3 = const Color(0xff13d38e);

        switch (i) {
          case 0:
            return PieChartSectionData(
                color: color0.withOpacity(opacity),
                value: value1,
                title: '',
                radius: radius1,
                titleStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff044d7c)),
                titlePositionPercentageOffset: 0.3,
                badgeWidget: _Badge(
                  'assets/images/shopping.png',
                  size: size,
                ),
                badgePositionPercentageOffset: .96);
          case 1:
            return PieChartSectionData(
              color: color1.withOpacity(opacity),
              value: value2,
              title: '',
              radius: radius2,
              titleStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff90672d)),
              titlePositionPercentageOffset: 0.3,
              badgeWidget: _Badge(
                  'assets/images/income.png',
                  size: size,
                ),
                badgePositionPercentageOffset: .85
            );

          default:
            throw Error();
        }
      },
    );
  }
}

class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;

  const _Badge(
    this.svgAsset, {
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Image.asset(svgAsset),
      ),
    );
  }
}