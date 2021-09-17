import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/data/database.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late File imagePicked;
  bool isPicked = false;
  final imageBox = Hive.box('image');

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/submit_name.png'),
              fit: BoxFit.fill,
            ),
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                (isPicked)
                    ? CircleAvatar(
                        backgroundImage: FileImage(imagePicked),
                        radius: 50,
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 50,
                      ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff4F98A1)),
                      ),
                      height: 30,
                      width: 100,
                      child: Center(
                        child: Text(
                          'Choose image',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onTap: () async {
                      await pickImage();
                      if (isPicked) {
                        imageBox.put(0, ImageUrl(imagePicked.readAsBytesSync()));
                          AutoRouter.of(context).push(AmountInputRoute());
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
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
