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
      body: Column(
        children: [
          SizedBox(
            height: 400
          ),
          Center(
            child: Container(
          width: double.infinity,
          height: 30,
          child: LiquidCustomProgressIndicator(
            direction: Axis.vertical,
            shapePath: _coinpath(),
            valueColor: AlwaysStoppedAnimation(Color(0xffffD700)),
            value: 0.9,
            backgroundColor: Color(0xffffed87),
           
          ),
        )),
          Center(
            child: Container(
          width: double.infinity,
          height: 140,
          child: LiquidCustomProgressIndicator(
            direction: Axis.vertical,
            shapePath: _piggypath(),
            valueColor: AlwaysStoppedAnimation(Color(0xff4F98A1)),
            value: 0.2,
            backgroundColor: Color(0xffa6cbd6),
            center: Text('20',style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ),
        )),
        ]
      ),
    );
  }

  Path _piggypath() {
    return Path()
         ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(130, 10, 150, 120), Radius.circular(600)))
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(120, 60, 20, 25), Radius.circular(300)))
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(160, 110, 25, 30), Radius.circular(5)))
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(220, 110, 25, 30), Radius.circular(5)))


          ..quadraticBezierTo(260, 50, 280, 30)
          ..moveTo(160, 20)
          ..lineTo(160, 0)
          ..lineTo(180, 20)
          ..moveTo(130, 20)
          ..lineTo(50, 20)
         
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
              Rect.fromLTWH(193, 0, 25, 25), Radius.circular(300)))
          ..close()

        

        ;
  }
}