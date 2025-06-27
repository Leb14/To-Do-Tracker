// import 'package:flutter/material.dart';
//
// abstract class BaseResponsiveWidget extends StatelessWidget {
//   final double wideScreenThreshold;
//
//   const BaseResponsiveWidget({super.key, this.wideScreenThreshold = 700});
//
//   double getTitleFontSize(BoxConstraints constraints) {
//     return constraints.maxWidth >= wideScreenThreshold ? 50 : 10;
//   }
//
//   double getContentFontSize(BoxConstraints constraints) {
//     return constraints.maxWidth >= wideScreenThreshold ? 40 : 10;
//   }
//
//   TextStyle getTitleTextStyle(BoxConstraints constraints) {
//     return TextStyle(
//       color: Colors.black,
//       fontSize: getTitleFontSize(constraints),
//       fontWeight: FontWeight.bold,
//     );
//   }
//
//   TextStyle getContentTextStyle(BoxConstraints constraints) {
//     return TextStyle(
//       color: Colors.black,
//       fontSize: getContentFontSize(constraints),
//     );
//   }
//
//   Widget buildResponsive(BuildContext context, BoxConstraints constraints);
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: buildResponsive);
//   }
// }
