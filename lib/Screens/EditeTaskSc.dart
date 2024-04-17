import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Tasks.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    widget.task.save();
  }
}
