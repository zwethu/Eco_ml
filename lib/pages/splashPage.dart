import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eco_ml/pages/homePage.dart';
import 'package:eco_ml/pages/onboardPage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: Image.asset('assets/images/appLogo.png'),
          nextScreen: MainPage(),
          ),
    );
  }
}
class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final piggyBox = Hive.box('amount');
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool check = piggyBox.get(1)??true;
       
    return Container(
      child: (() {
   if(check){
     return OnboardPage();
   }else if(check==false){
    return HomePage();
   }
}()),
    );
  }
}

