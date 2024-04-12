import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AddTask.dart';
import 'package:flutter_application_1/models/Tasks.dart';
import 'package:flutter_application_1/widget/Task.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box<Task>('task');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTask(),
            ),
          );
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: HexColor('#18Daa3'),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Image(
            image: AssetImage('images/icon_add.png'),
          ),
        ),
      ),
      backgroundColor: HexColor('#EFEFEF'),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (BuildContext context, int index) {
                var task = box.values.toList()[index];
                return Taskwidget(task: task);
              },
            );
          },
        ),
      ),
    );
  }
}
