import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/data/database.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:eco_ml/data/incomeData.dart';
import 'package:hive/hive.dart';
import 'package:eco_ml/data/outcomeData.dart';

class TransactionPage extends StatefulWidget {
  final int id;
  const TransactionPage({Key? key,required this.id}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final int id = Hive.box('id').get(0);
  final bool check = Hive.box('id').get(1);
  final transactionBox = Hive.box('transactions');
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  @override
  void initState() {
    amountController.addListener(() => setState(() {}));
    noteController.addListener(() => setState(() {}));
    super.initState();
  }
  @override
  void dispose() {
    // Hive.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff4F98A1),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: check
                                  ? incomeData[id].colorName
                                  : outcomeData[id].colorName,
                            ),
                            child: Icon(
                              check
                                  ? incomeData[id].iconName
                                  : outcomeData[id].iconName,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            check
                                ? incomeData[id].title
                                : outcomeData[id].title,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'money',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  autofocus: true,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60,
                ),
                TextField(
                  controller: noteController,
                  keyboardType: TextInputType.text,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Write the description...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff4F98A1)),
                  ),
                  onPressed: () {
                    
                    transactionBox.add(Transaction(widget.id,check?false:true,double.parse(amountController.text),noteController.text));
                    // transactionBox.put(0, id);
                    // transactionBox.put(1, check?false:true);
                    // transactionBox.put(2, double.parse(amountController.text));
                    // transactionBox.put(4, noteController.text);
                    final data = transactionBox.getAt(1)as Transaction;
                    // print(transactionBox.getAt(0));
                    print(data.iconId);
                    print(data.isExpense);
                    print(data.description);
                    AutoRouter.of(context).push(HomeRoute());
                    
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
