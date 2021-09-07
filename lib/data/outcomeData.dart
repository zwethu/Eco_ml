



import 'package:flutter/material.dart';

class OutcomeData{
  final IconData iconName;
  final Color colorName;
  final String title;

  OutcomeData(this.iconName, this.colorName, this.title);

}


List<OutcomeData> outcomeData = [
  OutcomeData(Icons.restaurant_rounded, Color(0xff543399), "Food"),
  OutcomeData(Icons.storefront_rounded, Color(0xff87240f), "Clothing"),
  OutcomeData(Icons.local_mall_rounded, Color(0xff53431b), "Shopping"),
  OutcomeData(Icons.card_giftcard_rounded, Color(0xff19b2d5), "Gift"),
  OutcomeData(Icons.directions_bus_filled_rounded, Color(0xff65d452), "Transportation"),
  OutcomeData(Icons.receipt_long_rounded, Color(0xff49e2f1), "Bill"),
  OutcomeData(Icons.explore_rounded, Color(0xff9b3b77), "Travel"),
  OutcomeData(Icons.family_restroom_rounded, Color(0xff7b65a1), "Family"),
  OutcomeData(Icons.school_rounded, Color(0xff934232), "Education"),
  OutcomeData(Icons.fitness_center_rounded, Color(0xffbfeb8d), "Sport"),
  OutcomeData(Icons.payments_rounded, Color(0xff388a70), "Tax"),
  OutcomeData(Icons.microwave_rounded, Color(0xff365e25), "Electronic"),
  OutcomeData(Icons.spa_rounded, Color(0xff6015f5), "Health"),
  OutcomeData(Icons.tv_rounded, Color(0xfffb5f01), "Entertainment"),
  OutcomeData(Icons.time_to_leave_rounded, Color(0xff905a90), "Car"),
  OutcomeData(Icons.health_and_safety_rounded, Color(0xffd6abb0), "Insurance"),
  OutcomeData(Icons.pets_rounded, Color(0xffd64804), "Pet"),
  OutcomeData(Icons.cottage_rounded, Color(0xff39dbd3), "House"),
  OutcomeData(Icons.work_rounded, Color(0xff5a021d), "Work"),
  OutcomeData(Icons.volunteer_activism_rounded, Color(0xff6c0695), "Donation"),
  OutcomeData(Icons.add_rounded, Color(0xff0796d1), "Other"),
];