import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 0)
class UserName extends HiveObject{
  @HiveField(0)
  late String username;
}

