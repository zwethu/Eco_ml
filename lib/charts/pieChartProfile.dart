import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartProfileState();
}

class PieChartProfileState extends State {
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
          elevation: 3,
          shadowColor: Colors.grey,
          child: Row(
            children: <Widget>[
             
              
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
                          show:false,
                        ),
                        sectionsSpace: 6,
                        centerSpaceRadius: 0,
                        sections: showingSections()),
                  ),
                ),
              ),
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
                          margin: EdgeInsets.only(right: 20, left: 10),
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Color(0xff3f5166)),
                        ),
                        Text('Total',
                            style: TextStyle(
                                color: Color(0xff4F98A1),
                                fontWeight: FontWeight.bold,
                                fontSize: 23))
                      ],
                    ),
                    SizedBox(
                      height:20
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 12),
                          height: 21,
                          width: 21,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Color(0xffff7733)),
                        ),
                        Text('Saving',
                            style: TextStyle(
                                color: Color(0xff4F98A1),
                                fontWeight: FontWeight.bold,
                                fontSize: 22))
                      ],
                    )
                  ],
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
        
        double value1 = 80;
        double value2 = 40;
        

        final color0 = const Color(0xff3f5166);
        final color1 = const Color(0xffff7733);


        switch (i) {
          case 0:
            return PieChartSectionData(
              
                color: color0,
                value: value1,
                title: '80%',
                radius: 55,
                titleStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff)),
                titlePositionPercentageOffset: 0.5,
                );
          case 1:
            return PieChartSectionData(
             
              color: color1.withOpacity(opacity),
              value: value2,
              title: '20%',
              radius: 65,
              titleStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff)),
              titlePositionPercentageOffset: 0.5,

               borderSide: BorderSide(

                
                color: Colors.white,
                width: 6
              ),
              
            );

          default:
            throw Error();
        }
      },
    );
  }
}



