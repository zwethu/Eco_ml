



import 'package:flutter/material.dart';

class IncomeData{
  final IconData iconName;
  final Color colorName;
  final String title;

  IncomeData(this.iconName, this.colorName, this.title);

}


List<IncomeData> incomeData = [
  IncomeData(Icons.paid_rounded, Color(0xff543399), "Salary"),
  IncomeData(Icons.emoji_events_rounded, Color(0xff87240f), "Award"),
  IncomeData(Icons.business_rounded, Color(0xff53431b), "Grants"),
  IncomeData(Icons.receipt_rounded, Color(0xff19b2d5), "Sale"),
  IncomeData(Icons.car_rental_rounded, Color(0xff65d452), "Rental"),
  IncomeData(Icons.receipt_long_rounded,Color(0xff49e2f1), "Refund"),
  IncomeData(Icons.local_activity_rounded, Color(0xff9b3b77), "Coupon"),
  IncomeData(Icons.casino_rounded, Color(0xff7b65a1), "Lottery"),
  IncomeData(Icons.apartment_rounded, Color(0xff934232), "Investment"),
  IncomeData(Icons.add_rounded, Color(0xffbfeb8d), "other"),

];