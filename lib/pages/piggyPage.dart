import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';

import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PiggyPage extends StatefulWidget {
  const PiggyPage({Key? key}) : super(key: key);

  @override
  _PiggyPageState createState() => _PiggyPageState();
}

class _PiggyPageState extends State<PiggyPage> {
  final piggyBox = Hive.box('piggy');
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    amountController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff4F98A1),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  
                  child: Image.asset('assets/images/piggy.png'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'How much percentage do\nyou wanna save?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4F98A1),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: TextField(
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    controller: amountController,
                    decoration: InputDecoration(
                      hintText: 'Enter percentage%',
                      filled: true,
                      hintStyle: TextStyle(
                        color: Color(0xff9E8FAE),
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                      ),
                      fillColor: Color(0xffFDF1F1),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade300, width: 3)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade300, width: 3)),
                      border: InputBorder.none,
                      suffixIcon: amountController.text.isEmpty
                          ? Container(
                              width: 0,
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Color(0xff9E8FAE),
                                size: 20,
                              ),
                              onPressed: () => amountController.clear()),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.grey,
                    cursorHeight: 32,
                    style: TextStyle(
                        color: Color(0xff9E8FAE),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Color(0xff72ADB4)),
                    ),
                    onPressed: () {
                      final calculateData = double.parse(amountController.text);
                      piggyBox.put(0, calculateData);
                      piggyBox.put(1, true);
                      final data = piggyBox.get(0);
                      print(data);
                      navigateToHome(context);
                       final player = AudioCache();
                          player.play('images/coin.wav');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Text(
                        " Submit ",
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
      ),
    );
  }
}

void navigateToHome(context) {
  AutoRouter.of(context).push(HomeRoute());
}
