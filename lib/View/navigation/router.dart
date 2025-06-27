import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/layout_config.dart';
import '../pages/desc_page.dart';

class LayoutRouter extends GetxService {
  final GlobalKey<NavigatorState> firstKey = GlobalKey();
  final GlobalKey<NavigatorState> secondKey = GlobalKey();

  bool get isWideScreen =>
      Get.context != null &&
          MediaQuery.of(Get.context!).size.width >= LayoutConfig.wideScreenBreakpoint;

  NavigatorState? get currentNavigator =>
      isWideScreen ? secondKey.currentState : firstKey.currentState;

  void push(Widget page, {bool toFirstColumn = false}) {
    if (toFirstColumn || !isWideScreen) {
      firstKey.currentState?.push(MaterialPageRoute(builder: (_) => page));
    } else {
      secondKey.currentState?.push(MaterialPageRoute(builder: (_) => page));
    }
  }

  void pop() {
    currentNavigator?.maybePop();
  }

  void pushDescriptionIfNarrow({
    required String title,
    required String description,
    bool toFirstColumn = false,
  }) {
    if (!isWideScreen) {
      push(
        DescriptionPage(title: title, description: description),
        toFirstColumn: true, // force to use `firstKey`
      );
    }
  }
}
