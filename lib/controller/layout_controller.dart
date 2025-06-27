import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/config/layout_config.dart';

class LayoutController extends GetxController {
  double screenWidth = 0;
  double wideScreenThreshold = LayoutConfig.wideScreenBreakpoint;

  bool get isWide => screenWidth >= wideScreenThreshold;

  void updateSize(double width) {
    screenWidth = width;
    update();
  }

  TextStyle get titleStyle => TextStyle(
    fontSize: screenWidth / 45,
    fontWeight: FontWeight.bold,
    color: Get.context?.theme.textTheme.titleLarge?.color ?? Colors.red,
  );

  TextStyle get contentStyle => TextStyle(
    fontSize: screenWidth / 50,
    color: Get.context?.theme.textTheme.bodyMedium?.color ?? Colors.white,
  );
}
