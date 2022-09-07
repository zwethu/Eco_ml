import 'package:eco_ml/data/database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PieChartProfileTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartProfileTwoState();
}

class PieChartProfileTwoState extends State {
  final box = Hive.box('transactions');
  int touchedIndex = -1;
  final incomeBox = Hive.box('income');
   final outcomeBox = Hive.box('outcome');
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
     var totalSumIncome = 0.0;
    double totalSumExpense = 0.0;
    for (var i = 0; i < box.length; i++) {
      final data = box.getAt(i) as Transaction;
      if (data.isExpense) {
        totalSumExpense += data.amount;
      } else if (!data.isExpense) {
        totalSumIncome += data.amount;
      }
    }
    return List.generate(
      2,
      (i) {
        final isTouched = i == touchedIndex;
        final opacity = isTouched ? 1.0 : 0.6;
        double size =  50;
  
       

        final color0 = const Color(0xffff828a);
        final color1 = const Color(0xff0FE944);

        // ignore: unused_local_variable
        double outcome = outcomeBox.get(0);
        // ignore: unused_local_variable
        double income = incomeBox.get(0);
        var incomeValue = ( totalSumIncome /( totalSumIncome +totalSumExpense))*100;
        var outcomeValue = (totalSumExpense/( totalSumIncome +totalSumExpense))*100;
         final double radius1 = incomeValue < outcomeValue
            ? isTouched
                ? 70
                : 65
            : isTouched
                ? 65
                : 65;
        final double radius2 = outcomeValue < incomeValue
            ? isTouched
                ? 70
                : 65
            : isTouched
                ? 65
                : 65;
        switch (i) {
          case 0:
            return PieChartSectionData(
                color: color0.withOpacity(opacity),
                value: outcomeValue,
                title: '',
                radius: radius2,
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
              value: incomeValue,
              title: '',
              radius: radius1,
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