import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/enum/enum_page_region.dart';
import 'package:untitled/View/navigation/router.dart' show LayoutRouter;

class RoutedPage extends StatelessWidget {
  final Widget child;
  final String pageKey;
  final PageRegion region;

  const RoutedPage({
    super.key,
    required this.child,
    required this.pageKey,
    required this.region,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          debugPrint('📤 $pageKey popped from ${region.name} with result: $result');
          final layout = Get.find<LayoutRouter>();
          layout.removePageFromStack(pageKey, region);
        }
      },
      child: child,
    );
  }
}

