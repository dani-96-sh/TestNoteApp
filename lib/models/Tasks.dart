import 'package:hive/hive.dart';

part 'Tasks.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  Task({required this.title, required this.subtitle, this.isDoone = false});
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2, defaultValue: false)
  bool isDoone;
}
