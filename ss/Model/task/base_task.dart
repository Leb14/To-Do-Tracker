// import 'package:untitled/Model/task/enum_task_type.dart';
//
// import 'daily_task.dart';
// import 'job_task.dart';
//
// abstract class Task
// {
//   final String title;
//   final String description;
//   final DateTime dueDate;
//   bool isCompleted;
//
//   Task({
//     required this.title,
//     required this.description,
//     required this.dueDate,
//     this.isCompleted = false,
//   });
//
//   void markComplete() {
//     isCompleted = true;
//   }
//
//   TaskType getTaskType();
//
//   Map<String, dynamic> toJson()
//   {
//     return
//         {
//           'title': title,
//           'description': description,
//           'isCompleted': isCompleted,
//           'dueDate': dueDate.toIso8601String()
//         };
//   }
//
//   /// Abstract fromJson - child class must implement this
//   static Task fromJson(Map<String, dynamic> json) {
//     switch (json['type']) {
//       case 'Job':
//         return JobTask.fromJson(json);
//       case 'Daily':
//         return DailyTask.fromJson(json);
//       default:
//         throw Exception('Unknown task type: ${json['type']}');
//     }
//   }
// }