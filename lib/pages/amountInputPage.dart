import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AmountInputPage extends StatefulWidget {
  const AmountInputPage({Key? key}) : super(key: key);

  @override
  _AmountInputPageState createState() => _AmountInputPageState();
}

class _AmountInputPageState extends State<AmountInputPage> {
  String name = '';
  TextEditingController amountController = TextEditingController();
 

  @override
  void initState() {
    super.initState();
    amountController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final dataName = Hive.box('database').getAt(0);
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
              'Hello ${dataName.username},\nNice to meet you!',
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
              controller: amountController,
              decoration: InputDecoration(
                hintText: 'Enter your Total Amount',
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
                suffixIcon: amountController.text.isEmpty
                    ? Container(
                        width: 0,
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Color(0xff9E8FAE),
                          size: 20,
                        ),
                        onPressed: () => amountController.clear()),
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
                navigateToHome(context);
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

void navigateToHome(context) {
  AutoRouter.of(context).push(HomeRoute());
}