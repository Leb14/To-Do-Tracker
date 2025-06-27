// import 'package:untitled/Model/task/base_task.dart';
// import 'package:untitled/Model/task/enum_task_type.dart';
//
// class JobTask extends Task {
//   final String projectName;
//
//   JobTask({
//     required super.title,
//     required super.description,
//     required super.dueDate,
//     required this.projectName,
//     bool isCompleted = false
//   });
//
//   @override
//   TaskType getTaskType() => TaskType.job;
//
//   @override
//   Map<String, dynamic> toJson() {
//     final baseJson = super.toJson();
//     baseJson['projectName'] = projectName;
//     return baseJson;
//   }
//
//   static JobTask fromJson(Map<String, dynamic> json) {
//     return JobTask(
//       title: json['title'],
//       description: json['description'],
//       dueDate: DateTime.parse(json['dueDate']),
//       projectName: json['projectName'],
//       isCompleted: json['isCompleted'] ?? false,
//     );
//   }
// }