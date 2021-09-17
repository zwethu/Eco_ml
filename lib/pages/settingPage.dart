import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/data/database.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final usernameBox = Hive.box('username');
  final amountBox = Hive.box('amount');
  final idBox = Hive.box('id');
  final transactionBox = Hive.box('transactions');
  final incomeBox = Hive.box('income');
  final outcomeBox = Hive.box('outcome');
  final piggyBox = Hive.box('piggy');
  final imageBox = Hive.box('image');
  late File imagePicked;
  bool isPicked = false;
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagePicked = File(pickedFile.path);
        isPicked = true;
      });
    } else {
      isPicked = false;
    }
  }

  void getData() {
    // ignore: unused_local_variable
    final data = imageBox.get(0) as ImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff4F98A1),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          width: MediaQuery.of(context).size.width / 1.2,
          height: 282,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff4F98A1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                width: MediaQuery.of(context).size.width / 1.2,
                height: 20,
                child: Text(''),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff4F98A1)),
                  ),
                  height: 65,
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Username',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.edit_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  naviToNameChangePage(context);
                },
              ),
              InkWell(
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff4F98A1)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Profile Picture',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.photo_camera_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  await pickImage();
                  if (isPicked) {
                    setState(() {
                      imageBox.put(0, ImageUrl(imagePicked.readAsBytesSync()));
                      AutoRouter.of(context).push(HomeRoute());
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Chooes profile picture',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        backgroundColor: Color(0xff4F98A1),
                        elevation: 10,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                  setState(() {
                    getData();
                  });
                },
              ),
              InkWell(
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff4F98A1)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Saving %',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.savings_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  naviToAmountChangePage(context);
                },
              ),
              InkWell(
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff4F98A1)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reset Data',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.restart_alt_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  usernameBox.clear();
                  amountBox.clear();
                  idBox.clear();
                  transactionBox.clear();
                  incomeBox.clear();
                  outcomeBox.clear();
                  piggyBox.clear();
                  imageBox.clear();
                  navigateToOnboard(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void naviToAmountChangePage(BuildContext context) {
  AutoRouter.of(context).push(AmountChangeRoute());
}

void naviToNameChangePage(BuildContext context) {
  AutoRouter.of(context).push(NameChangeRoute());
}

void navigateToOnboard(context) {
  AutoRouter.of(context).push(OnboardRoute());
}
