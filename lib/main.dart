import 'package:eco_ml/bottomenum.dart';
import 'package:eco_ml/bottominfo.dart';
import 'package:eco_ml/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eco Ml',
      home: ChangeNotifierProvider<BottomInfo>(
        create: (context) =>BottomInfo(Bottom.wallet, '',null),
        child: HomePage()),
    );
  }
}