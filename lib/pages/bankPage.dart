import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';

class BankPage extends StatefulWidget {
  const BankPage({Key? key}) : super(key: key);

  @override
  _BankPageState createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: Image.asset('assets/images/piggy.png'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Piggy Bank',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4F98A1),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.all(40),
              child: Text(
                'Piggy saves the certain \npercentage of money from\nyour total amount.',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff4F98A1),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color(0xff72ADB4)),
                ),
                onPressed: () => navigateToPiggyBank(context),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(
                    "Let's save!",
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
    );
    
  }
}

void navigateToPiggyBank(context) {
  AutoRouter.of(context).push(PiggyRoute());
}

