import 'package:flutter/material.dart';
import '../models/task.dart';

class Tasks with ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> _doneTasks =[];

  List<Task> get tasks {
    return [..._tasks];
  }

  List<Task> get donetasks {
    return [..._doneTasks];
  }

  void addTask(String category, String title, String chosenPriority,
      TimeOfDay start, TimeOfDay end) {
    Task task = Task(
      category: category,
      title: title,
      startTime: start,
      id: DateTime.now(),
      endTime: end,
      priority: chosenPriority,
    );
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(DateTime id) 
  {


    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();

  



  }

  void deleteDoneTask(DateTime id) 
  {


    _doneTasks.removeWhere((task) => task.id == id);
    notifyListeners();

  



  }

  void doneTaskUpdate(DateTime id)
  {
    _doneTasks.add(_tasks.firstWhere((task) => task.id == id));
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }





}
