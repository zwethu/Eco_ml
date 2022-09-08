import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/data/database.dart';
import 'package:eco_ml/pages/pages.dart';
import 'package:eco_ml/pages/settingPage.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final username = Hive.box('username').getAt(0) as UserName;
  final piggyBox = Hive.box('piggy');
  final imageBox = Hive.box('image');
  // late ImageUrl? url;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //  Hive.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final imageData = imageBox.get(0)as ImageUrl;
    bool check = piggyBox.get(1);

    final pages = [
      WalletPage(),
      ReportPage(),
      (() {
        if (check) {
          return PiggyHomePage();
        } else {
          return BankPage();
        }
      }()),
      SettingPage(),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title: Container(
            child: Text(
              "${username.username}'s Wallet",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 1,
          backgroundColor: Color(0xff4F98A1),
          actions: [
            GestureDetector(
              child: CircleAvatar(
                backgroundImage: MemoryImage(imageData.url),
              ),
              onTap: (){
                navigateToProfile(context);
              },
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 4,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xff4F98A1),
          unselectedItemColor: Color(0xffB8ADAD),
          iconSize: 30,
          selectedFontSize: 18,
          unselectedFontSize: 18,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.signal_cellular_alt_rounded),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.savings_rounded),
              label: 'P Bank',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff72ADB4),
          onPressed: () => navigateToCategories(context),
          child: Icon(Icons.edit_rounded),
        ),
      ),
    );
  }
}

void navigateToProfile(BuildContext context) {
  AutoRouter.of(context).push(ProfileRoute());
}

void navigateToCategories(BuildContext context) {
  AutoRouter.of(context).push(CategoriesRoute());
}
