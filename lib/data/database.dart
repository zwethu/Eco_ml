import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 0)
class UserName extends HiveObject{
  @HiveField(0)
  final String username;
  UserName(this.username);
}

@HiveType(typeId: 1)
class TotalAmount extends HiveObject{
  @HiveField(0)
  final double amount;
  @HiveField(1)
  final bool showOnboard;
  TotalAmount(this.amount,this.showOnboard);
}

@HiveType(typeId:2)
class IconData {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final bool isIncome;
  IconData(this.id,this.isIncome);
}


