import 'package:eco_ml/charts/pieChartProfile.dart';
import 'package:eco_ml/charts/pieChartProfile2.dart';
import 'package:eco_ml/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final imageBox = Hive.box('image');
  final username = Hive.box('username').getAt(0) as UserName;
  @override
  Widget build(BuildContext context) {
    final imageData = imageBox.get(0)as ImageUrl;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff4F98A1),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: MemoryImage(imageData.url),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          '${username.username}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4F98A1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PieChartProfile(),
                  PieChartProfileTwo()
                ]),
          ),
        ),
      ),
    );
  }
}
