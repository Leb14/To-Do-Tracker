// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../ViewModel/layout_controller.dart';
//
// abstract class BaseLayout extends StatefulWidget {
//   final int breakpoint;
//   final int maxColumns;
//   final screenController = Get.find<ScreenController>();
//
//   BaseLayout({super.key, this.breakpoint = 1024, this.maxColumns = 2});
//
//   Widget? buildSecondScreen(
//     BuildContext context,
//     bool isWideScreen,
//     GlobalKey<NavigatorState> firstNavigatorKey,
//     GlobalKey<NavigatorState> secondNavigatorKey,
//     GlobalKey<NavigatorState> singleNavigatorKey,
//   );
//
//   Widget buildFirstScreen(
//     BuildContext context,
//     bool isWideScreen,
//     GlobalKey<NavigatorState> firstNavigatorKey,
//     GlobalKey<NavigatorState> secondNavigatorKey,
//     GlobalKey<NavigatorState> singleNavigatorKey,
//   );
//
//   @override
//   BaseLayoutState createState() => BaseLayoutState();
// }
//
// class BaseLayoutState extends State<BaseLayout> {
//   final GlobalKey<NavigatorState> firstNavigatorKey =
//       GlobalKey<NavigatorState>();
//   final GlobalKey<NavigatorState> secondNavigatorKey =
//       GlobalKey<NavigatorState>();
//   final GlobalKey<NavigatorState> singleNavigatorKey =
//       GlobalKey<NavigatorState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isWideScreen = constraints.maxWidth >= widget.breakpoint;
//
//         if (isWideScreen) {
//           return Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Navigator(
//                   key: firstNavigatorKey,
//                   onGenerateRoute:
//                       (_) => MaterialPageRoute(
//                         builder:
//                             (context) => widget.buildFirstScreen(
//                               context,
//                               isWideScreen,
//                               firstNavigatorKey,
//                               secondNavigatorKey,
//                               singleNavigatorKey,
//                             ),
//                       ),
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Navigator(
//                   key: secondNavigatorKey,
//                   onGenerateRoute: (_) {
//                     final secondScreen = widget.buildSecondScreen(
//                       context,
//                       isWideScreen,
//                       firstNavigatorKey,
//                       secondNavigatorKey,
//                       singleNavigatorKey,
//                     );
//                     return MaterialPageRoute(
//                       builder:
//                           (context) =>
//                               Scaffold(
//                                 body: secondScreen ??
//                                 Center(
//                                   child: Text(
//                                     'No content available',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         } else {
//           return Navigator(
//             key: singleNavigatorKey,
//             onGenerateRoute:
//                 (_) => MaterialPageRoute(
//                   builder:
//                       (context) => widget.buildFirstScreen(
//                         context,
//                         isWideScreen,
//                         firstNavigatorKey,
//                         secondNavigatorKey,
//                         singleNavigatorKey,
//                       ),
//                 ),
//           );
//         }
//       },
//     );
//   }
// }
