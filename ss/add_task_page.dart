// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:untitled/Model/task/enum_task_type.dart';
// import 'package:untitled/Model/task/task_dto.dart';
// import 'package:untitled/View/components/custom_form_field.dart';
// import 'package:untitled/ViewModel/task_view_controller.dart';
//
// import '../../ViewModel/layout_controller.dart';
//
// class AddTaskPage extends StatefulWidget {
//   final bool isWideScreen;
//
//   const AddTaskPage({
//     super.key,
//     required this.isWideScreen,
//   });
//
//   @override
//   State<AddTaskPage> createState() => _AddTaskPageState();
// }
//
// class _AddTaskPageState extends State<AddTaskPage> {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TaskViewModel taskController = Get.find<TaskViewModel>();
//
//   TaskType selectedTaskType = TaskType.empty;
//
//   void addTask(BuildContext context) {
//     final taskData = TaskDTO(
//       title: titleController.text,
//       description: descriptionController.text,
//       dueDate: DateTime.now(),
//     );
//
//     taskController.addTask(type: selectedTaskType, data: taskData);
//     Get.back(); // Close the screen after adding
//   }
//
//   // @override
//   // void didChangeDependencies() {
//   //   super.didChangeDependencies();
//   //
//   //   WidgetsBinding.instance.addPostFrameCallback((_) {
//   //     final screenWidth = MediaQuery.of(context).size.width;
//   //     const breakpoint = 1024;
//   //
//   //     if (screenWidth >= breakpoint) {
//   //       // Automatically go back and let BaseLayout handle two-column layout
//   //       Get.back();
//   //
//   //       // Push the actual second column content
//   //       final screenController = Get.find<ScreenController>();
//   //       screenController.updateSecondScreen(const AddTaskPage());
//   //     }
//   //   });
//   // }
//
//   @override
//   void dispose() {
//     titleController.dispose();
//     descriptionController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             if (widget.isWideScreen) {
//               if (widget.secondNavigatorKey.currentState?.canPop() ?? false) {
//                 widget.secondNavigatorKey.currentState?.pop();
//               } else {
//                 // Optional: fallback or close whole screen if no back stack
//                 Navigator.of(context).maybePop();
//               }
//             } else {
//               if (widget.singleNavigatorKey.currentState?.canPop() ?? false) {
//                 widget.singleNavigatorKey.currentState?.pop();
//               } else {
//                 Navigator.of(context).maybePop();
//               }
//             }
//           },
//           icon: const Icon(Icons.arrow_back_ios_new),
//         ),
//         title: Text(
//           'To-Do',
//           style: GoogleFonts.dancingScript(
//             textStyle: const TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: ListView(
//             shrinkWrap: true,
//             children: [
//               const SizedBox(height: 20),
//               const Text('Create Task', style: TextStyle(fontSize: 22)),
//               const SizedBox(height: 30),
//               CustomFormField(
//                 controller: titleController,
//                 labelText: 'Title',
//                 hintText: 'What to do...',
//               ),
//               const SizedBox(height: 15.0),
//               CustomFormField(
//                 controller: descriptionController,
//                 labelText: 'Description',
//                 hintText: 'Tell me more...',
//               ),
//               const SizedBox(height: 15.0),
//               Row(
//                 children: [
//                   const SizedBox(
//                     width: 120,
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text('Category', style: TextStyle(fontSize: 12)),
//                     ),
//                   ),
//                   DropdownButton<TaskType>(
//                     value: selectedTaskType,
//                     items:
//                         TaskType.values.map((type) {
//                           return DropdownMenuItem<TaskType>(
//                             value: type,
//                             child: Text(type.displayName),
//                           );
//                         }).toList(),
//                     onChanged: (newValue) {
//                       if (newValue != null) {
//                         setState(() {
//                           selectedTaskType = newValue;
//                         });
//                       }
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () => addTask(context),
//                 child: const Text('Create'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
