import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/data/database.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NameInputPage extends StatefulWidget {
  const NameInputPage({Key? key}) : super(key: key);

  @override
  _NameInputPageState createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {
  String name = '';
  var nameBox = Hive.openBox('database');

  TextEditingController nameController = TextEditingController();
  void addData(UserName database) {
    Hive.box('database').put(0, database);
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Text(
              'Welcome User,\nHow can we call you??',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff9E8FAE),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 50, 40, 50),
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                filled: true,
                hintStyle: TextStyle(
                  color: Color(0xff9E8FAE),
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
                fillColor: Color(0xffFDF1F1),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 3)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 3)),
                border: InputBorder.none,
                suffixIcon: nameController.text.isEmpty
                    ? Container(
                        width: 0,
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Color(0xff9E8FAE),
                          size: 20,
                        ),
                        onPressed: () => nameController.clear()),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.grey,
              cursorHeight: 32,
              style: TextStyle(
                  color: Color(0xff9E8FAE),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xffE3A5AA)),
              ),
              onPressed: () {
                final newData = UserName()..username=nameController.text.toString();
                addData(newData);
                newData.save();
                navigateToAmountInputPage(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffFDF1F1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

void navigateToAmountInputPage(context) {
  AutoRouter.of(context).push(AmountInputRoute());
}