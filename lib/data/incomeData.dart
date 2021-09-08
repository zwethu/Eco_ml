



import 'package:flutter/material.dart';

class IncomeData{
  final IconData iconName;
  final Color colorName;
  final String title;

  IncomeData(this.iconName, this.colorName, this.title);

}


List<IncomeData> incomeData = [
  IncomeData(Icons.paid_rounded, Color(0xffffadd6), "Salary"),
  IncomeData(Icons.emoji_events_rounded, Color(0xfff7983e), "Award"),
  IncomeData(Icons.business_rounded, Color(0xff3ef721), "Grants"),
  IncomeData(Icons.receipt_rounded, Color(0xff19b2d5), "Sale"),
  IncomeData(Icons.car_rental_rounded, Color(0xffccbdff), "Rental"),
  IncomeData(Icons.receipt_long_rounded,Color(0xff49e2f1), "Refund"),
  IncomeData(Icons.local_activity_rounded, Color(0xfff779eb), "Coupon"),
  IncomeData(Icons.casino_rounded, Color(0xff79f7cb), "Lottery"),
  IncomeData(Icons.apartment_rounded, Color(0xfff3f779), "Investment"),
  IncomeData(Icons.add_rounded, Color(0xff0796d1), "other"),

];