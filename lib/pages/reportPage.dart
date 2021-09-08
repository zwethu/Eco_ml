import 'package:eco_ml/charts/pieChart.dart';
import 'package:eco_ml/charts/pieChart2.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height:10),
          DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Color(0xffADADAD),
                    indicatorColor: Color(0xff4F98A1),
                    indicatorWeight: 5.0,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    tabs: [
                      Tab(text: 'Income'),
                      Tab(text: 'Expense'),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/1.5, //height of TabBarView
                  child: TabBarView(
                    children: <Widget>[
                      Container(
                        child: PieChartClass(),
                      ),
                      Container(
                        child: PieChartTwoClass(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
