// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:untitled/View/pages/view_detail.dart';
//
// import '../../controller/layout_controller.dart';
// import '../component/description_pane.dart';
// import '../navigation/router.dart';
//
// class DescriptionPage extends StatelessWidget {
//   final String title;
//   final String description;
//
//   const DescriptionPage({
//     super.key,
//     required this.title,
//     required this.description,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final layoutRouter = Get.find<LayoutRouter>();
//
//     return GetBuilder<LayoutController>(
//       builder: (layout) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(title, style: layout.titleStyle),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: DefaultTextStyle(
//               style: layout.contentStyle,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const DescriptionPane(),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         layoutRouter.push(
//                           const ViewDetailPage(),
//                           toFirstColumn: false,
//                         );
//                       },
//                       child: Text('View More', style: layout.titleStyle),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
