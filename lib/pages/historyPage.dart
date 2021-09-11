import 'package:eco_ml/data/incomeData.dart';
import 'package:eco_ml/data/outcomeData.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HistoryPage extends StatefulWidget {
  final index;
  const HistoryPage({Key? key, required this.index}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final transactionBox = Hive.box('transactions');
  @override
  Widget build(BuildContext context) {
    final data = transactionBox.getAt(widget.index);
    final date = data.datatime;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Transaction',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff4F98A1),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    '${date.month} / ${date.day} / ${date.year}',
                    style: TextStyle(
                      color: Color(0xff4F98A1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: data.isExpense
                            ? incomeData[widget.index].colorName
                            : outcomeData[widget.index].colorName,
                      ),
                      child: Icon(
                        data.isExpense
                            ? incomeData[widget.index].iconName
                            : outcomeData[widget.index].iconName,
                        color: Colors.grey.shade100,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      data.isExpense
                          ? outcomeData[data.iconId].title
                          : incomeData[data.iconId].title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      data.isExpense
                          ? data.amount.toString()
                          : data.amount.toString(),
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff4F98A1),
                    ),
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    data.description,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
}
