import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/enum/enum_page_region.dart';
import 'package:untitled/View/pages/placeholder_page.dart';
import 'package:untitled/View/navigation/routed_page.dart';
import 'package:untitled/controller/layout_controller.dart';
import '../navigation/router.dart';

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutRouter>();
    final layoutController = Get.find<LayoutController>();

    debugPrint("🔄 ResponsiveHomePage.build called");

    return LayoutBuilder(
      builder: (context, constraints) {
        layoutController.updateSize(constraints.maxWidth);
        layout.handleLayoutChangeIfNeeded();
        final isWide = layoutController.isWide;

        return isWide
            ? _buildWideLayout(layout)
            : _buildNarrowLayout(layout);
      },
    );
  }

  Widget _buildWideLayout(LayoutRouter layout) {
    return Row(
      children: [
        Expanded(child: _buildNavigator(layout, PageRegion.left)),
        const VerticalDivider(width: 1),
        Expanded(child: _buildNavigator(layout, PageRegion.right)),
      ],
    );
  }

  Widget _buildNarrowLayout(LayoutRouter layout) {
    return _buildNavigator(layout, PageRegion.left, useMergedStack: true);
  }

  Widget _buildNavigator(LayoutRouter layout, PageRegion region,
      {bool useMergedStack = false}) {
    return Obx(() {
      final pages = useMergedStack
          ? layout.logicalStack
          : layout.logicalStack.where((e) => e.region == region).toList();

      final pageList = pages.isEmpty && region == PageRegion.right
          ? [
        const MaterialPage(
          key: ValueKey('placeholder'),
          child: RoutedPage(
            pageKey: 'placeholder',
            region: PageRegion.right,
            child: PlaceholderPage(title: 'Right Pane'),
          ),
        ),
      ]
          : pages
          .map((item) => MaterialPage(
        key: ValueKey(item.pageKey),
        child: item.page,
      ))
          .toList();

      final navKey =
      (region == PageRegion.left) ? layout.firstKey : layout.secondKey;

      return Navigator(
        key: navKey,
        pages: pageList,
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;
          layout.removePageFromStack(
            route.settings.name ?? '',
            useMergedStack ? PageRegion.left : region,
          );
          return true;
        },
      );
    });
  }
}
