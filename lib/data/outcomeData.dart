



import 'package:flutter/material.dart';

class OutcomeData{
  final IconData iconName;
  final Color colorName;
  final String title;

  OutcomeData(this.iconName, this.colorName, this.title);

}


List<OutcomeData> outcomeData = [
  OutcomeData(Icons.restaurant_rounded, Color(0xffe09243), "Food"),
  OutcomeData(Icons.storefront_rounded, Color(0xff95dec8), "Clothing"),
  OutcomeData(Icons.local_mall_rounded, Color(0xffe677d9), "Shopping"),
  OutcomeData(Icons.card_giftcard_rounded, Color(0xffff9442), "Gift"),
  OutcomeData(Icons.directions_bus_filled_rounded, Color(0xff65d452), "Transportation"),
  OutcomeData(Icons.receipt_long_rounded, Color(0xff49e2f1), "Bill"),
  OutcomeData(Icons.explore_rounded, Color(0xff38fcbe), "Travel"),
  OutcomeData(Icons.family_restroom_rounded, Color(0xffd663ff), "Family"),
  OutcomeData(Icons.school_rounded, Color(0xfff59c76), "Education"),
  OutcomeData(Icons.fitness_center_rounded, Color(0xff63b9ff), "Sport"),
  OutcomeData(Icons.payments_rounded, Color(0xff388a70), "Tax"),
  OutcomeData(Icons.microwave_rounded, Color(0xffbfeb8d), "Electronic"),
  OutcomeData(Icons.spa_rounded, Color(0xffff9c9c), "Health"),
  OutcomeData(Icons.tv_rounded, Color(0xffdc9cff), "Entertainment"),
  OutcomeData(Icons.time_to_leave_rounded, Color(0xff905a90), "Car"),
  OutcomeData(Icons.health_and_safety_rounded, Color(0xff76d1f5), "Insurance"),
  OutcomeData(Icons.pets_rounded, Color(0xffd64804), "Pet"),
  OutcomeData(Icons.cottage_rounded, Color(0xff39dbd3), "House"),
  OutcomeData(Icons.work_rounded, Color(0xffff9ccf), "Work"),
  OutcomeData(Icons.volunteer_activism_rounded, Color(0xffffadf5), "Donation"),
  OutcomeData(Icons.add_rounded, Color(0xff0796d1), "Other"),
];