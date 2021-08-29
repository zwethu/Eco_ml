import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({ Key? key }) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
       image: DecorationImage(
         image: AssetImage('assets/images/home_page.png'),
         fit: BoxFit.fill,
       ),
      ),
      child: Text('sdf'),
    );
  }
}