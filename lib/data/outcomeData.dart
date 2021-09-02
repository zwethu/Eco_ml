



import 'package:flutter/material.dart';

class OutcomeData{
  final IconData iconName;
  final String colorName;
  final String title;

  OutcomeData(this.iconName, this.colorName, this.title);

}


List<OutcomeData> outcomeData = [
  OutcomeData(Icons.restaurant_rounded, "#543399", "Food"),
  OutcomeData(Icons.storefront_rounded, "#87240f", "Clothing"),
  OutcomeData(Icons.local_mall_rounded, "#53431b", "Shopping"),
  OutcomeData(Icons.card_giftcard_rounded, "#19b2d5", "Gift"),
  OutcomeData(Icons.directions_bus_filled_rounded, "#65d452", "Transportation"),
  OutcomeData(Icons.receipt_long_rounded, "#49e2f1", "Bill"),
  OutcomeData(Icons.explore_rounded, "#9b3b77", "Travel"),
  OutcomeData(Icons.family_restroom_rounded, "#7b65a1", "Family"),
  OutcomeData(Icons.school_rounded, "#934232", "Education"),
  OutcomeData(Icons.fitness_center_rounded, "#bfeb8d", "Sport"),
  OutcomeData(Icons.payments_rounded, "#388a70", "Tax"),
  OutcomeData(Icons.microwave_rounded, "#365e25", "Electronic"),
  OutcomeData(Icons.spa_rounded, "#6015f5", "Health"),
  OutcomeData(Icons.tv_rounded, "#fb5f01", "Entertainment"),
  OutcomeData(Icons.time_to_leave_rounded, "#905a90", "Car"),
  OutcomeData(Icons.health_and_safety_rounded, "#d6abb0", "Insurance"),
  OutcomeData(Icons.pets_rounded, "#d64804", "Pet"),
  OutcomeData(Icons.cottage_rounded, "#39dbd3", "House"),
  OutcomeData(Icons.work_rounded, "#5a021d", "Work"),
  OutcomeData(Icons.volunteer_activism_rounded, "#6c0695", "Donation"),
  OutcomeData(Icons.add_rounded, "#0796d1", "Other"),

];