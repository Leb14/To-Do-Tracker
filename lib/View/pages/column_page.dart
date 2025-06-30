// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controller/layout_controller.dart';
// import '../../ViewModel/column_page_view_model.dart';
//
// class ColumnPage extends StatelessWidget {
//   final String label;
//   final bool toFirst;
//
//   const ColumnPage({
//     super.key,
//     required this.label,
//     this.toFirst = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final layoutController = Get.find<LayoutController>();
//     final viewModel = ColumnPageViewModel();
//
//     final titleStyle = layoutController.titleStyle;
//     final spacing = layoutController.isWide ? 40.0 : 20.0;
//
//     return Obx(() => Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               viewModel.onButtonPressed(
//                 id: 'button1',
//                 title: 'Button 1',
//                 description: 'This is the description for Button 1.',
//                 toFirstColumn: toFirst,
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: viewModel.selectedButton.value == 'button1'
//                   ? Colors.red
//                   : null,
//             ),
//             child: Text('Button 1', style: titleStyle),
//           ),
//           SizedBox(height: spacing),
//           ElevatedButton(
//             onPressed: () {
//               viewModel.onButtonPressed(
//                 id: 'button2',
//                 title: 'Button 2',
//                 description: 'This is the description for Button 2.',
//                 toFirstColumn: toFirst,
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: viewModel.selectedButton.value == 'button2'
//                   ? Colors.blue
//                   : null,
//             ),
//             child: Text('Button 2', style: titleStyle),
//           ),
//           SizedBox(height: spacing),
//           ElevatedButton(
//             onPressed: () {
//               viewModel.goToExtraPage(toFirstColumn: toFirst);
//             },
//             child: Text('View more button', style: titleStyle),
//           ),
//         ],
//       ),
//     ));
//   }
// }
