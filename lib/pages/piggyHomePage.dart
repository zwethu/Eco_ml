import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/data/database.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class PiggyHomePage extends StatefulWidget {
  PiggyHomePage({Key? key}) : super(key: key);

  @override
  _PiggyHomePageState createState() => _PiggyHomePageState();
}

class _PiggyHomePageState extends State<PiggyHomePage>
    with SingleTickerProviderStateMixin {
  final box = Hive.box('transactions');
  final incomeBox = Hive.box('income');
  final outcomeBox = Hive.box('outcome');
  final piggyBox = Hive.box('piggy');
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    );
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final amount = Hive.box('amount').get(0);
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
      percent = (total * (piggydata / 100));
    } else {
      percent = 0;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Text(
                  'Piggy Bank',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xff4F98A1),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: LiquidCustomProgressIndicator(
                  direction: Axis.vertical,
                  shapePath: _coinpath(),
                  valueColor: AlwaysStoppedAnimation(Color(0xff4F98A1)),
                  value: 0.7,
                  backgroundColor: Color(0xffa6cbd6),
                ),
              )),
              Center(
                child: GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    child: LiquidCustomProgressIndicator(
                      direction: Axis.vertical,
                      shapePath: _piggypath(),
                      valueColor: AlwaysStoppedAnimation(Color(0xff4F98A1)),
                      value: (piggydata) * 0.01,
                      backgroundColor: Color(0xffa6cbd6),
                      center: Text(
                        '$piggydata%',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    final player = AudioCache();
                    player.play('images/water.wav');
                  },
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  'Your saving percentage: $piggydata%',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff4F98A1),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Your saving amount: $percent Ks ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff4F98A1),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.all(35),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff72ADB4)),
                  ),
                  onPressed: () {
                    naviToAmountChangePage(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Text(
                      "Edit %",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Path _piggypath() {
    return Path()
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(120, 10, 150, 120), Radius.circular(600)))
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(110, 60, 20, 25), Radius.circular(300)))
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(150, 110, 25, 30), Radius.circular(5)))
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(210, 110, 25, 30), Radius.circular(5)))
          ..quadraticBezierTo(250, 50, 270, 30)
          ..moveTo(150, 20)
          ..lineTo(150, 0)
          ..lineTo(170, 20)
          ..moveTo(120, 20)
          ..lineTo(40, 20)
          ..close()

        // ..quadraticBezierTo(35, 110, 55, 120)
        // ..quadraticBezierTo(65, 30, 85, 35)
        // ..quadraticBezierTo(205, 80, 405, 35)
        // ..quadraticBezierTo(485, 18, 55, 15)
        // ..quadraticBezierTo(205, 0, 85, 15)
        // ..lineTo(55, 0)
        // ..lineTo(45, 15)
        // ..quadraticBezierTo(65, 13, 55, 15)

        ;
  }

  Path _coinpath() {
    return Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(183, 0, 25, 25), Radius.circular(300)))
      ..close();
  }
}

void naviToAmountChangePage(BuildContext context) {
  AutoRouter.of(context).push(AmountChangeRoute());
}
