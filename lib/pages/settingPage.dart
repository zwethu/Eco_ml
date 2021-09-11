import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/data/outcomeData.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final usernameBox = Hive.box('username');
  final amountBox = Hive.box('amount');
  final idBox = Hive.box('id');
  final transactionBox = Hive.box('transactions');
  final incomeBox = Hive.box('income');
  final outcomeBox = Hive.box('outcome');
  final piggyBox = Hive.box('piggy');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff4F98A1),
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          width: MediaQuery.of(context).size.width / 1.2,
          height: 360,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff4F98A1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                width: MediaQuery.of(context).size.width / 1.2,
                height: 20,
                child: Text(''),
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Username',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.edit_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  naviToNameChangePage(context);
                },
              ),
              Divider(
                color: Color(0xff4F98A1),
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Profile Picture',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.photo_camera_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                onTap: (){

                },
              ),
              Divider(
                color: Color(0xff4F98A1),
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Saving %',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.savings_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  naviToAmountChangePage(context);
                },
              ),
              Divider(
                color: Color(0xff4F98A1),
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reset Data',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.restart_alt_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  usernameBox.clear();
                  amountBox.clear();
                  idBox.clear();
                  transactionBox.clear();
                  incomeBox.clear();
                  outcomeBox.clear();
                  piggyBox.clear();
                  navigateToOnboard(context);
                },
              ),
              Divider(
                color: Color(0xff4F98A1),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Theme:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.edit_rounded,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void naviToAmountChangePage(BuildContext context){
  AutoRouter.of(context).push(AmountChangeRoute());
}

void naviToNameChangePage(BuildContext context){
  AutoRouter.of(context).push(NameChangeRoute());
}
void navigateToOnboard(context) {
  AutoRouter.of(context).push(OnboardRoute());
}