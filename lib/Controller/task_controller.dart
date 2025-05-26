import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/task_model.dart';

class TaskController {
  List<Task> tasks = [];
  Function? updateView;

  TaskController({this.updateView});

  void addTask(String title, String description) {
    tasks.add(Task(title: title, description: description));
    saveTasks();
    updateView?.call(); // Refreshes the View using callback
  }

  void saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskListJson =
        tasks.map((task) => jsonEncode(task.toJson())).toList();
    prefs.setStringList('tasks', taskListJson);
  }

  void loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? taskListJson = prefs.getStringList('tasks');
    if (taskListJson != null) {
      tasks =
          taskListJson.map((task) => Task.fromJson(jsonDecode(task))).toList();
    }
    updateView?.call(); // Refreshes the View after loading tasks
  }
}
