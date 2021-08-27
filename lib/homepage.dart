import 'package:eco_ml/bottomenum.dart';
import 'package:eco_ml/bottominfo.dart';
import 'package:eco_ml/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          width: 200,
          padding: EdgeInsets.only(top: 2),
            
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 2,
                spreadRadius: 1

              )
            ],
            
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: bottomItems
                .map((currentBottomInfo) => bottomNavi(currentBottomInfo))
                .toList(),
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        body: Consumer<BottomInfo>(
            builder: (BuildContext context, BottomInfo value, Widget? child) {
          if (value.bottom == Bottom.wallet)
            return Container(
                padding: EdgeInsets.only(left: 50, right: 50),
                margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                child: Center(
                  child: Text('Hi'),
                ));
          else
            return Container(
              child: Center(
                child: Text('hello'),
              ),
            );
        }));
  }
}

Widget bottomNavi(BottomInfo currentBottomInfo) {
  return Consumer<BottomInfo>(
      builder: (BuildContext context, BottomInfo value, Widget? child) {
    return ElevatedButton(

       style: TextButton.styleFrom(
         elevation: 0,
              backgroundColor: Colors.transparent),

        onPressed: () {
          
          var bottomInfo = Provider.of<BottomInfo>(context, listen: false);
          bottomInfo.updateBottom(currentBottomInfo);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            
            Icon(currentBottomInfo.icon,color:currentBottomInfo.bottom == value.bottom
                  ? Colors.green
                  : Colors.grey ,),
                  SizedBox(
                    height: 5,
                  ),
            Text(currentBottomInfo.title,style: TextStyle(color: currentBottomInfo.bottom == value.bottom
                  ? Colors.green
                  : Colors.grey),),
                   SizedBox(
                    height: 3,
                  ),
          ],
        ));

    
  });
}
