import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/data/database.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NameChangePage extends StatefulWidget {
  const NameChangePage({Key? key}) : super(key: key);

  @override
  _NameChangePageState createState() => _NameChangePageState();
}

class _NameChangePageState extends State<NameChangePage> {
  final nameBox = Hive.box('username');

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // Hive.close();
    AutoRouter.of(context).pop(NameChangeRoute());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Color(0xff4F98A1),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
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
                    autofocus: true,
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
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 3)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 3)),
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
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffE3A5AA)),
                    ),
                    onPressed: () {
                      final newData = UserName(nameController.text.toString());
                      addData(newData);
                      newData.save();
                      navigateToHome(context);
    
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
          ),
        ),
      ),
    );
  }
}

void navigateToHome(context) {
  AutoRouter.of(context).push(HomeRoute());
}

void addData(UserName database) {
  Hive.box('username').put(0, database);
}
