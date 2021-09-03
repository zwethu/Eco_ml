import 'package:flutter/material.dart';

class PiggyPage extends StatefulWidget {
  const PiggyPage({ Key? key }) : super(key: key);

  @override
  _PiggyPageState createState() => _PiggyPageState();
}

class _PiggyPageState extends State<PiggyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff4F98A1),
      ),
      body:Container(
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
              margin: EdgeInsets.all(35),
              child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xff72ADB4)),
              ),
              onPressed: () => null,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
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
    );
  }
}
