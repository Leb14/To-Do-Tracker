import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/task/base_task.dart';
import '../Model/task/daily_task_factory.dart';
import '../Model/task/enum_task_type.dart';
import '../Model/task/job_task_factory.dart';
import '../Model/task/task_dto.dart';
import '../Model/task/task_factory.dart';

class TaskViewModel extends GetxController {
  final TextEditingController textController = TextEditingController();
  final RxList<Task> tasks = <Task>[].obs;

  final Map<TaskType, TaskFactory> taskFactoryMap = {
    TaskType.job: JobTaskFactory(),
    TaskType.daily: DailyTaskFactory(),
  };


  void loadTasks() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList('tasks');

    if (taskList != null) {
      taskList.map((jsonString) => Task.fromJson(jsonDecode(jsonString)));
    }
  }

  void saveTasks() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> taskList = tasks
        .map((task) => task.toJson())
        .toList();
    prefs.setStringList(
        'task', taskList.map((json) => jsonEncode(json)).toList());
  }

  void addTask({required TaskType type, required TaskDTO data}) {
    final factory = taskFactoryMap[type];

    final newTask = factory!.create(data);
    tasks.add(newTask);
    saveTasks();
  }
}
//
//   void deleteTask(int index)
//   {
//     tasks.removeAt(index);
//     saveTasks();
//   }
//
//   void toggleTaskCompletion(int index)
//   {
//     Task task = tasks[index];
//
//     if (task.dueDate != null && task.dueDate!.isBefore(DateTime.now()))
//     {
//       task.isCompleted = true;
//     }
//     else
//     {
//       task.isCompleted = !task.isCompleted;
//     }
//
//     tasks[index] = task;
//     saveTasks();
//   }
//
//   voidToggleTaskImportance(int index)
//   {
//     Task task = tasks[index];
//     task.isImportant = !task.isImportant;
//
//     tasks[index] = task;
//     saveTasks();
//   }
//
//   void setTaskDueDate(int index, DateTime? dueDate)
//   {
//     Task task = tasks[index];
//     task.dueDate = dueDate;
//
//     tasks[index] = task;
//     saveTasks();
//   }
//
//   void setTaskPriority(int index, int priority) {
//     Task task = tasks[index];
//     task.priority = priority;
//
//     tasks[index] = task;
//     saveTasks();
//   }
//
//   @override
//   void onInit(){
//     super.onInit();
//     loadTasks();
//   }
// }
