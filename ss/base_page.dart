// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controller/layout_controller.dart';
// import '../../controller/theme_controller.dart';
//
// class BasePage extends StatelessWidget {
//   final String title;
//   final Widget child;
//
//   const BasePage({
//     super.key,
//     required this.title,
//     required this.child,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final layout = Get.find<LayoutController>();
//     final themeController = Get.find<ThemeController>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           title,
//           style: layout.titleStyle,
//         ),
//         actions: [
//           Obx(() => Switch(
//             value: themeController.isDarkMode,
//             onChanged: (val) => themeController.toggleTheme(val),
//           )),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: DefaultTextStyle(
//           style: layout.contentStyle,
//           child: child,
//         ),
//       ),
//     );
//   }
// }
