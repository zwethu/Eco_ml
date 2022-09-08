import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/data/database.dart';
import 'package:eco_ml/data/incomeData.dart';
import 'package:eco_ml/data/outcomeData.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final box = Hive.box('transactions');
  final incomeBox = Hive.box('income');
  final outcomeBox = Hive.box('outcome');
  final piggyBox = Hive.box('piggy');
  @override
  void dispose() {
    // Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final totalAmount;
    // final totalExpense;
    // final totalIncome;
    final amount = Hive.box('amount').get(0);
    // double income = incomeBox.get(0);
    // double outcome = outcomeBox.get(0);
    double piggydata = piggyBox.get(0);
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

    double total = amount.amount + (totalSumIncome - totalSumExpense);
    double percent;
    if (total >= 0) {
      percent = total - (total * (piggydata / 100));
    } else {
      percent = total;
    }
    // final data = Hive.box('trasactions').get(0);
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Color(0xffF9E7EB)]),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Total Balance',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff201A3C),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '$percent Ks',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff201A3C),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffD2F1F2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                        child: Image.asset(
                          'assets/images/income.png',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          'Income',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                        child: Text(
                          '$totalSumIncome',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffF9E7EB),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                        child: Image.asset(
                          'assets/images/shopping.png',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          'Expense',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                        child: Text(
                          '$totalSumExpense',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Color(0xffD8E8EA),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.topLeft,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Transactions',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: ValueListenableBuilder(
                      valueListenable: box.listenable(),
                      builder: (BuildContext context, box, _) {
                        final length = Hive.box('transactions').length;
                        final dataBox = Hive.box('transactions');
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: length,
                          itemBuilder: (BuildContext context, int index) {
                            final data =
                                dataBox.getAt(index) as Transaction;
                            return Dismissible(
                              key: UniqueKey(),
                              background: Container(
                                padding: EdgeInsets.only(right: 20),
                                alignment: Alignment.centerRight,
                                color: Colors.red,
                                child: Column(children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Icon(Icons.delete, color: Colors.white),
                                  Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ]),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (DismissDirection direction) {
                                if (direction ==
                                    DismissDirection.endToStart) {
                                  deleteTransaction(data);
                                }
                                setState(() {});
                              },
                              child: GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    // border: Border.all(
                                    //     color: Colors.black38, width: 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  padding: EdgeInsets.all(5),
                                  child: ListTile(
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15),
                                        color: data.isExpense
                                            ? outcomeData[data.iconId]
                                                .colorName
                                            : incomeData[data.iconId]
                                                .colorName,
                                      ),
                                      child: Icon(
                                        data.isExpense
                                            ? outcomeData[data.iconId]
                                                .iconName
                                            : incomeData[data.iconId]
                                                .iconName,
                                        size: 25,
                                        color: Colors.grey.shade100,
                                      ),
                                    ),
                                    title: Text(
                                      data.isExpense
                                          ? outcomeData[data.iconId].title
                                          : incomeData[data.iconId].title,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff201A3C),
                                      ),
                                    ),
                                    subtitle: Text(
                                      DateFormat.yMMMMd()
                                          .format(data.datatime)
                                          .toString(),
                                    ),
                                    trailing: Text(
                                      data.isExpense
                                          ? '-' +
                                              data.amount.toString() +
                                              ' Ks'
                                          : '+' +
                                              data.amount.toString() +
                                              ' Ks',
                                      style: TextStyle(
                                          color: data.isExpense
                                              ? Colors.red
                                              : Colors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  showDialog(
                                    useRootNavigator: false,
                                    context: context,
                                    builder: (_) => SimpleDialog(
                                      contentPadding: EdgeInsets.all(0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      children: [
                                        Center(
                                          child: InkWell(
                                            child: Card(
                                              color: Color(0xffD2F1F2),
                                              margin: EdgeInsets.fromLTRB(
                                                  5, 0, 5, 5),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(18),
                                                        height: 50,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color: data.isExpense
                                                              ? outcomeData[data
                                                                      .iconId]
                                                                  .colorName
                                                              : incomeData[data
                                                                      .iconId]
                                                                  .colorName,
                                                        ),
                                                        child: Icon(
                                                          data.isExpense
                                                              ? outcomeData[data
                                                                      .iconId]
                                                                  .iconName
                                                              : incomeData[data
                                                                      .iconId]
                                                                  .iconName,
                                                          size: 25,
                                                          color: Colors
                                                              .grey.shade100,
                                                        ),
                                                      ),
                                                      Text(
                                                        data.isExpense
                                                            ? outcomeData[
                                                                    data.iconId]
                                                                .title
                                                            : incomeData[
                                                                    data.iconId]
                                                                .title,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff201A3C),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        20, 0, 20, 5),
                                                    child: Text(
                                                      data.isExpense
                                                          ? '-' +
                                                              data.amount
                                                                  .toString() +
                                                              ' Ks'
                                                          : '+' +
                                                              data.amount
                                                                  .toString() +
                                                              ' Ks',
                                                      style: TextStyle(
                                                          color: data.isExpense
                                                              ? Colors.red
                                                              : Colors.green,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        20, 10, 20, 5),
                                                    child: Row(children: [
                                                      Text(
                                                        "Date:   ",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        DateFormat.yMMMMd()
                                                            .format(
                                                                data.datatime)
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ]),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        20, 10, 20, 20),
                                                    child: Row(children: [
                                                      Text(
                                                        "Discription:   ",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      GestureDetector(
                                                        child: Text(
                                                          data.description == ''
                                                              ? 'No description to show'
                                                              : 'Tap to view discription',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        onTap: (){
                                                          naviToHistoryPage(context, index);
                                                        }
                                                      ),
                                                    ]),
                                                  )
                                                ],
                                              ),
                                            ),
                                            onTap: (){
                                              naviToHistoryPage(context, index);
                                            },
                                          ),
                                        )
                                      ],
                                      titlePadding:
                                          EdgeInsets.fromLTRB(15, 10, 0, 8),
                                      title: Row(
                                        children: [
                                          Text(
                                            'Transaction Dialog',
                                            style: TextStyle(
                                                color: Color(0xff4F98A1)),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 40, right: 0),
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 20,
                                                  color: Color(0xff4F98A1),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void naviToHistoryPage(BuildContext context, int id) {
  AutoRouter.of(context).push(HistoryRoute(index: id));
}

void deleteTransaction(Transaction transcation) {
  transcation.delete();
}
