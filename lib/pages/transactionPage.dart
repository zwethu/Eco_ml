import 'package:flutter/material.dart';
import 'package:eco_ml/data/incomeData.dart';
import 'package:hive/hive.dart';
import 'package:eco_ml/data/outcomeData.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final i = Hive.box('id').get(0);
  
  final TextEditingController customController = TextEditingController();
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
                          Icon(
                            outcomeData[i].iconName,
                            size: 25,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            outcomeData[i].title,
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
                          Icon(
                            incomeData[1].iconName,
                            size: 25,
                          ),
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
                  height: 50,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60,
                ),
                TextField(
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
                  onPressed: () {},
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
