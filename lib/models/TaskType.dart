import 'package:hive_flutter/hive_flutter.dart';

part 'TaskType.g.dart';

@HiveType(typeId: 2)
class TaskType {
  TaskType(
      {required this.image, required this.title, required this.TaskTypeEnum});
  @HiveField(0)
  String image;
  @HiveField(1)
  String title;
  @HiveField(2)
  Enum TaskTypeEnum;
}
