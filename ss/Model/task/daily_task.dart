// import 'package:untitled/Model/task/base_task.dart';
// import 'package:untitled/Model/task/enum_task_type.dart';
//
// class DailyTask extends Task {
//   final bool isRepeated;
//
//   DailyTask({
//     required super.title,
//     required super.description,
//     required super.dueDate,
//     required this.isRepeated,
//     bool isCompleted = false
//   });
//
//   @override
//   TaskType getTaskType() => TaskType.daily;
//
//   @override
//   Map<String, dynamic> toJson() {
//     final baseJson = super.toJson();
//     baseJson['isRepeated'] = isRepeated;
//     return baseJson;
//   }
//
//   static DailyTask fromJson(Map<String, dynamic> json) {
//     return DailyTask(
//       title: json['title'],
//       description: json['description'],
//       dueDate: DateTime.parse(json['dueDate']),
//       isRepeated: json['isRepeated'],
//       isCompleted: json['isCompleted'] ?? false,
//     );
//   }
// }