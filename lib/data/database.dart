import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 0)
class UserName extends HiveObject {
  @HiveField(0, defaultValue: 'Unknown')
  final String username;
  UserName(this.username);
}

@HiveType(typeId: 1)
class TotalAmount extends HiveObject {
  @HiveField(0)
  double amount = 0;
  @HiveField(1, defaultValue: true)
  final bool showOnboard;
  TotalAmount(this.amount, this.showOnboard);
}

@HiveType(typeId: 2)
class IconData extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final bool isIncome;
  IconData(this.id, this.isIncome);
}

@HiveType(typeId: 3)
class Transaction extends HiveObject {
  @HiveField(0)
  late int iconId;
  @HiveField(1)
  late bool isExpense;
  @HiveField(2)
  late double amount;
  @HiveField(3)
  late DateTime datatime;
  @HiveField(4, defaultValue: 'No description')
  late String description;
  @HiveField(5, defaultValue: 1)
  late int cardNum;
  Transaction(this.iconId, this.isExpense, this.amount, this.datatime,
      this.description, this.cardNum);
}

@HiveType(typeId: 4)
class Income extends HiveObject {
  @HiveField(0)
  final amount;
  Income(this.amount);
}

@HiveType(typeId: 5)
class Outcome extends HiveObject {
  @HiveField(0)
  final amount;
  Outcome(this.amount);
}

@HiveType(typeId: 6)
class Piggy extends HiveObject {
  @HiveField(0)
  double percentage;
  @HiveField(1)
  bool showPiggy;
  Piggy(this.percentage, this.showPiggy);
}
