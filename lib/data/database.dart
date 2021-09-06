import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 0)
class Database  {
  @HiveField(0)
  late String username;
  @HiveField(1)
  late double totalAmount;
  @HiveField(2)
  late bool showOnboard = true;


}