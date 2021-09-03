import 'package:eco_ml/charts/pieChartProfile.dart';
import 'package:eco_ml/charts/pieChartProfile2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff4F98A1),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/profile.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                     height: 20,
              ),
              Column(
                children: [
                   CircleAvatar(
                     radius: 30,
                  backgroundImage: AssetImage('assets/images/avator.jpeg'),
                ),
                 SizedBox(
                     height: 20,
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Name :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xff4F98A1) )),
                      Text(' Yuya',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff4F98A1)))
                    ],
                  )
                  
                ],
              ),
               SizedBox(
                     height: 20,
              ),

              PieChartProfile(),
              PieChartProfileTwo()


            ]
          ),
        ),
          ],
        ),
      ),
    );
  }
}
