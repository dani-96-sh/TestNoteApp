import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Tasks.dart';
import 'package:flutter_application_1/widget/utility.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_pickerr/time_pickerr.dart';

// ignore: must_be_immutable
class EditeTask extends StatefulWidget {
  EditeTask({super.key, required this.task});
  Task task;
  @override
  State<EditeTask> createState() => _EditeTaskState();
}

class _EditeTaskState extends State<EditeTask> {
  FocusNode negahbanOne = FocusNode();
  FocusNode negahbanTwo = FocusNode();

  var box = Hive.box<Task>('task');
  DateTime? _time;

  int selecteditem = 0;

  var controllertitlecontent;
  var controllersubtitlecontent;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controllertitlecontent = TextEditingController(text: widget.task.title);
    controllersubtitlecontent =
        TextEditingController(text: widget.task.subtitle);
    negahbanOne.addListener(() {
      setState(() {});
    });
    negahbanTwo.addListener(() {
      setState(() {});
    });

    var index = GetTaskTypeList().indexWhere((element) {
      return element.TaskTypeEnum == widget.task.taskType.TaskTypeEnum;
    });

    selecteditem = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#E5E5E5'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllertitlecontent,
                    focusNode: negahbanOne,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(width: 2, color: HexColor('#F35383')),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(width: 2, color: HexColor('#C5C5C5')),
                      ),
                      label: Text('عنوان تسک'),
                      labelStyle: TextStyle(
                        color: negahbanOne.hasFocus
                            ? HexColor('#F35383')
                            : HexColor('#C5C5C5'),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllersubtitlecontent,
                    maxLines: 2,
                    focusNode: negahbanTwo,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(width: 2, color: HexColor('#F35383')),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(width: 2, color: HexColor('#C5C5C5')),
                      ),
                      label: Text('جزیات تسک'),
                      labelStyle: TextStyle(
                        color: negahbanTwo.hasFocus
                            ? HexColor('#F35383')
                            : HexColor('#C5C5C5'),
                      ),
                    ),
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomHourPicker(
                  title: 'انتخاب زمان ',
                  negativeButtonText: 'حذف کن',
                  positiveButtonText: 'انتخاب کن',
                  elevation: 4,
                  onNegativePressed: (context) {},
                  onPositivePressed: (context, time) {
                    _time = time;
                  },
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: GetTaskTypeList().length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selecteditem = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: selecteditem == index ? 4 : 1,
                                color: selecteditem == index
                                    ? Colors.lightBlue
                                    : Colors.grey)),
                        width: 140,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(GetTaskTypeList()[index].image),
                            Text(GetTaskTypeList()[index].title)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  String titlecontent = controllertitlecontent.text;
                  String subtitlecontent = controllersubtitlecontent.text;
                  EditeTask(titlecontent, subtitlecontent);
                  Navigator.pop(context);
                },
                child: Text(
                  'اضافه کردن تسک',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#18Daa3'),
                    minimumSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              )
            ],
          ),
        ),
      ),
    );
  }

  EditeTask(String title, String subtitle) {
    widget.task.title = title;
    widget.task.subtitle = subtitle;
    widget.task.time = _time!;
    widget.task.taskType = GetTaskTypeList()[selecteditem];
    widget.task.save();
  }
}
