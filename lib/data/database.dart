import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  final myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ['TODO LIST', false],
      ['DEMO', false]
    ];
  }

  void loadData() {
    toDoList = myBox.get('TODOLIST');
  }

  void updateDataBase() {
    myBox.put('TODOLIST', toDoList);
  }
}
