import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_to_do_list/custom/dialog_box.dart';
import 'package:hive_to_do_list/custom/todo_tile.dart';
import 'package:hive_to_do_list/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  final taskController = TextEditingController();

  @override
  void initState() {
    if (myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkboxTapped(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.updateDataBase();
    });
  }

  void createFunction() {
    setState(() {
      db.toDoList.add([taskController.text, false]);
      taskController.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: taskController,
          create: createFunction,
          cancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('TODO LIST'),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            onChanged: (value) => checkboxTapped(value, index),
            taskCompleted: db.toDoList[index][1],
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
