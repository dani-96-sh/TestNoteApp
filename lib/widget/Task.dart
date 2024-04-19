import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Screens/EditeTaskSc.dart';
import 'package:flutter_application_1/models/Tasks.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class Taskwidget extends StatefulWidget {
  Taskwidget({super.key, required this.task});
  Task task;
  @override
  State<Taskwidget> createState() => _TaskwidgetState();
}

class _TaskwidgetState extends State<Taskwidget> {
  bool ischeecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ischeecked = widget.task.isDoone;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          ischeecked = !ischeecked;
          widget.task.isDoone = ischeecked;
          widget.task.save();
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        width: double.infinity,
        height: 140,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                              value: ischeecked,
                              onChanged: (value) {
                                setState(() {
                                  ischeecked = value!;
                                });
                              }),
                          Text(
                            widget.task.title,
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        widget.task.subtitle,
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 90,
                            height: 28,
                            decoration: BoxDecoration(
                              color: HexColor('#E2F6F1'),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  Image.asset('images/icon_edit.png'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('ویرایش')
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditeTask(
                                          task: widget.task,
                                        )));
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 83,
                          height: 28,
                          decoration: BoxDecoration(
                            color: HexColor('#18Daa3'),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                Image.asset('images/icon_time.png'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                    '${widget.task.time.hour}:${getminute(widget.task.time)}')
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Image.asset('${widget.task.taskType.image}')
            ],
          ),
        ),
      ),
    );
  }

  getminute(DateTime time) {
    if (time.minute < 10) {
      return '0${time.minute}';
    } else {
      return time.minute.toString();
    }
  }
}
