// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:untitled/View/pages/home_page.dart';
// import 'package:untitled/View/widget/base_layout.dart';
//
// import 'pages/add_task_page.dart';
//
// class AddTaskScreen extends BaseLayout {
//   AddTaskScreen({super.key});
//
//   @override
//   Widget? buildSecondScreen(
//     BuildContext context,
//     bool isWideScreen,
//     GlobalKey<NavigatorState> firstNavigatorKey,
//     GlobalKey<NavigatorState> secondNavigatorKey,
//     GlobalKey<NavigatorState> singleNavigatorKey,
//   ) {
//     return AddTaskPage(
//       isWideScreen: isWideScreen,
//       singleNavigatorKey: singleNavigatorKey,
//       firstNavigatorKey: firstNavigatorKey,
//       secondNavigatorKey: secondNavigatorKey,
//     );
//   }
//
//   @override
//   Widget buildFirstScreen(
//     BuildContext context,
//     bool isWideScreen,
//     GlobalKey<NavigatorState> firstNavigatorKey,
//     GlobalKey<NavigatorState> secondNavigatorKey,
//     GlobalKey<NavigatorState> singleNavigatorKey,
//   ) {
//     return HomePage(
//       isWideScreen: isWideScreen,
//       firstNavigatorKey: firstNavigatorKey,
//       secondNavigatorKey: secondNavigatorKey,
//       singleNavigatorKey: singleNavigatorKey,
//     );
//   }
// }
