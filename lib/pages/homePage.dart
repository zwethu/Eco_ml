import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/pages/bankPage.dart';
import 'package:eco_ml/pages/pages.dart';
import 'package:eco_ml/pages/settingPage.dart';
import 'package:eco_ml/pages/walletPage.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final pages = [
    WalletPage(),
    ReportPage(),
    BankPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Container(
            child: Text(
              "Yuya's Wallet",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Color(0xff4F98A1),
          actions: [
            TextButton.icon(
              onPressed: (){
                navigateToProfile(context);
              },
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avator.jpeg'),
              ),
              label: Text(''),
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
            elevation: 2,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xffF0F0F0),
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
            onPressed: null,
            child: Icon(Icons.edit_rounded),
          ),
        ),
    );
  }
}

void navigateToProfile(BuildContext context){
  AutoRouter.of(context).push(ProfileRoute());
}
