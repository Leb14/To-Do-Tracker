// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:untitled/View/add_task_layout.dart';
// import 'package:untitled/View/view_tasks.dart';
// import 'package:untitled/ViewModel/layout_controller.dart';
//
// import 'add_task_page.dart';
// import '../components/custom_button.dart';
// import '../components/custom_carousel.dart';
//
// class HomePage extends StatelessWidget {
//   final bool isWideScreen;
//   final GlobalKey<NavigatorState> firstNavigatorKey;
//   final GlobalKey<NavigatorState> secondNavigatorKey;
//   final GlobalKey<NavigatorState> singleNavigatorKey;
//   final screenController = Get.find<ScreenController>();
//
//   HomePage({
//     super.key,
//     required this.isWideScreen,
//     required this.firstNavigatorKey,
//     required this.secondNavigatorKey,
//     required this.singleNavigatorKey
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "ToDo",
//               style: GoogleFonts.dancingScript(
//                 textStyle: TextStyle(
//                   fontSize: isWideScreen ? 45 : 35,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20.0,
//                 vertical: 0.0,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 160,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(15.0),
//                         topRight: Radius.circular(15.0),
//                       ),
//                     ),
//                     child: CustomCarousel(),
//                   ),
//                   Container(
//                     height: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.pink.shade50,
//                       borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(15.0),
//                         bottomRight: Radius.circular(15.0),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 15.0,
//                         vertical: 20.0,
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: CustomButton(
//                               label: 'Add Task',
//                               onPressed: () {
//                                 if (isWideScreen) {
//                                   // Push AddTaskPage inside second navigator:
//                                   secondNavigatorKey.currentState?.push(
//                                     MaterialPageRoute(
//                                       builder: (_) => AddTaskPage(isWideScreen:isWideScreen,singleNavigatorKey: singleNavigatorKey, firstNavigatorKey: firstNavigatorKey, secondNavigatorKey: secondNavigatorKey),
//                                     ),
//                                   );
//                                 } else {
//                                   singleNavigatorKey.currentState?.push(
//                                     MaterialPageRoute(
//                                       builder: (_) => AddTaskPage(isWideScreen:isWideScreen,singleNavigatorKey: singleNavigatorKey, firstNavigatorKey: firstNavigatorKey, secondNavigatorKey: secondNavigatorKey),
//                                     ),
//                                   );
//                                 }
//                               },
//                               icon: Icons.add,
//                             ),
//                           ),
//                           const SizedBox(width: 20),
//                           Expanded(
//                             child: CustomButton(
//                               label: 'View Tasks',
//                               onPressed: () {
//                                 if (isWideScreen) {
//                                   secondNavigatorKey.currentState?.push(
//                                     MaterialPageRoute(
//                                       builder: (_) => ViewTaskScreen(),
//                                     ),
//                                   );
//                                 } else {
//                                   singleNavigatorKey.currentState?.push(
//                                     MaterialPageRoute(
//                                       builder: (_) => ViewTaskScreen(),
//                                     ),
//                                   );
//                                 }
//                               },
//                               icon: Icons.view_list,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomSheet: PreferredSize(
//         preferredSize: const Size.fromHeight(kBottomNavigationBarHeight),
//         child: Material(
//           color: Colors.transparent,
//           elevation: 0,
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: Icon(Icons.copyright, color: Colors.grey.shade800),
//           ),
//         ),
//       ),
//     );
//   }
// }
