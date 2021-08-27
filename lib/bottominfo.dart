import 'package:eco_ml/bottomenum.dart';
import 'package:flutter/cupertino.dart';

class BottomInfo extends ChangeNotifier {
  Bottom bottom;
  String title;
  IconData? icon;
  BottomInfo(this.bottom, this.title, this.icon);

  updateBottom(BottomInfo bottomInfo) {
    this.bottom = bottomInfo.bottom;
    this.title = bottomInfo.title;
    this.icon = bottomInfo.icon;

    notifyListeners();
  }
}
