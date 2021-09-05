import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class PiggyHomePage extends StatefulWidget {
  PiggyHomePage({Key? key}) : super(key: key);

  @override
  _PiggyHomePageState createState() => _PiggyHomePageState();
}

class _PiggyHomePageState extends State<PiggyHomePage> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4F98A1),
        elevation: 1,
      ),
      body: Center(
          child: Container(
        width: double.infinity,
        height: 200,
        child: LiquidCustomProgressIndicator(
          direction: Axis.vertical,
          shapePath: _piggypath(),
          valueColor: AlwaysStoppedAnimation(Colors.green),
          value: 20,
          backgroundColor: Colors.green.shade100,
          center: Text('20'),
        ),
      )),
    );
  }

  Path _piggypath() {
    return Path()
         ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(130, 40, 150, 120), Radius.circular(600)))
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(120, 90, 20, 25), Radius.circular(300)))
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(160, 140, 25, 30), Radius.circular(5)))
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(220, 140, 25, 30), Radius.circular(5)))


          ..quadraticBezierTo(260, 80, 280, 60)
          ..moveTo(160, 50)
          ..lineTo(160, 30)
          ..lineTo(180, 50)
          ..moveTo(130, 50)
          ..lineTo(50, 50)
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(195, 10, 25, 25), Radius.circular(300)))
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
}

