// import 'package:flutter/material.dart';
//
// class ResponsiveBuilder extends StatelessWidget {
//   final Widget Function(BuildContext context, bool isWideScreen) builder;
//   final int breakpoint;
//
//   const ResponsiveBuilder({
//     super.key,
//     required this.builder,
//     this.breakpoint = 1024,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final isWide = MediaQuery.of(context).size.width >= breakpoint;
//     return builder(context, isWide);
//   }
// }
