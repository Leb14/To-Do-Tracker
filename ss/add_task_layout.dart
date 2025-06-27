// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:untitled/Model/task/enum_task_type.dart';
// import 'package:untitled/Model/task/task_dto.dart';
// import 'package:untitled/View/components/custom_form_field.dart';
// import 'package:untitled/ViewModel/task_view_controller.dart';
//
// class AddTaskScreen extends StatefulWidget {
//   const AddTaskScreen({super.key});
//
//   @override
//   State<AddTaskScreen> createState() => _AddTaskScreenState();
// }
//
// class _AddTaskScreenState extends State<AddTaskScreen> {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   TaskType selectedTaskType = TaskType.empty;
//
//   final taskController = Get.find<TaskViewModel>();
//
//   void addTask() {
//     final taskData = TaskDTO(
//       title: titleController.text,
//       description: descriptionController.text,
//       dueDate: DateTime.now(),
//     );
//     taskController.addTask(type: selectedTaskType, data: taskData);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: AppBar(
//           leading: IconButton(
//             onPressed: () => Get.back(),
//             icon: const Icon(Icons.arrow_back_ios_new),
//           ),
//           automaticallyImplyLeading: false,
//           title: Text(
//             'To-Do',
//             style: GoogleFonts.dancingScript(
//               textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Create Task', style: TextStyle(fontSize: 22)),
//               SizedBox(height: 30),
//               Column(
//                 children: [
//                   CustomFormField(
//                     controller: titleController,
//                     labelText: 'Title',
//                     hintText: 'What to do...',
//                   ),
//                   SizedBox(height: 15.0),
//                   CustomFormField(
//                     controller: descriptionController,
//                     labelText: 'Description',
//                     hintText: 'Tell me more...',
//                   ),
//                 ],
//               ),
//               SizedBox(height: 15.0),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 120,
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text('Category', style: TextStyle(fontSize: 12)),
//                     ),
//                   ),
//                   DropdownButton<TaskType>(
//                     value: selectedTaskType,
//                     items:
//                     TaskType.values.map((TaskType type) {
//                       return DropdownMenuItem<TaskType>(
//                         value: type,
//                         child: Text(
//                           type.displayName,
//                           style: TextStyle(
//                             fontWeight: FontWeight.normal,
//                             fontSize: 14,
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (TaskType? newValue) {
//                       if (newValue != null) {
//                         setState(() {
//                           selectedTaskType = newValue;
//                         });
//                       }
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 15.0,
//                   vertical: 0.0,
//                 ),
//                 child: ElevatedButton(
//                   onPressed: () => {addTask()},
//                   child: Text('Create'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
