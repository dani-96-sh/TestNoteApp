import 'package:flutter_application_1/models/TaskType.dart';
import 'package:hive/hive.dart';

part 'Tasks.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  Task(
      {required this.title,
      required this.subtitle,
      this.isDoone = false,
      required this.time,
      required this.taskType});
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2, defaultValue: false)
  bool isDoone;

  @HiveField(3)
  DateTime time;

  @HiveField(4)
  TaskType taskType;
}
