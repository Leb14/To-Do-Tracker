// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:untitled/ViewModel/task_view_controller.dart';
//
// class ViewTaskScreen extends StatefulWidget {
//   const ViewTaskScreen({super.key});
//
//   @override
//   State<ViewTaskScreen> createState() => _ViewTaskScreenState();
// }
//
// class _ViewTaskScreenState extends State<ViewTaskScreen> {
//
//   final controller = Get.find<TaskViewModel>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('All Tasks')),
//       body: Obx(() {
//         return ListView.builder(
//           itemCount: controller.tasks.length,
//           itemBuilder: (context, index) {
//             final task = controller.tasks[index];
//             return ListTile(
//               title: Text(task.title ?? 'No Title'), // Assuming task has a title
//               subtitle: Text(task.description ?? 'No Description'), // optional
//             );
//           },
//         );
//       }),
//     );
//   }
// }
