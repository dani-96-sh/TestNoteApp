import 'package:flutter_application_1/models/TaskTypeEnums.dart';
import 'package:flutter_application_1/models/TaskType.dart';

List<TaskType> GetTaskTypeList() {
  var list = [
    TaskType(
        image: 'images/meditate.png',
        title: 'focus',
        TaskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/social_frends.png',
        title: 'work',
        TaskTypeEnum: TaskTypeEnum.working),
    TaskType(
        image: 'images/hard_working.png',
        title: 'date',
        TaskTypeEnum: TaskTypeEnum.date)
  ];

  return list;
}
