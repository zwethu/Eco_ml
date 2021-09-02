



import 'package:flutter/material.dart';

class IncomeData{
  final IconData iconName;
  final String colorName;
  final String title;

  IncomeData(this.iconName, this.colorName, this.title);

}


List<IncomeData> incomeData = [
  IncomeData(Icons.paid_rounded, "#543399", "Salary"),
  IncomeData(Icons.emoji_events_rounded, "#87240f", "Award"),
  IncomeData(Icons.business_rounded, "#53431b", "Grants"),
  IncomeData(Icons.receipt_rounded, "#19b2d5", "Sale"),
  IncomeData(Icons.car_rental_rounded, "#65d452", "Rental"),
  IncomeData(Icons.receipt_long_rounded, "#49e2f1", "Refund"),
  IncomeData(Icons.local_activity_rounded, "#9b3b77", "Coupon"),
  IncomeData(Icons.casino_rounded, "#7b65a1", "Lottery"),
  IncomeData(Icons.apartment_rounded, "#934232", "Investment"),
  IncomeData(Icons.add_rounded, "#bfeb8d", "other"),

];