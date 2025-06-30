import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/pages/pages.dart';
import 'package:untitled/View/pages/view_detail.dart';
import '../navigation/router.dart';

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutRouter>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;
        layout.setScreenWidth(isWide); // Replace updateScreenSize

        return Obx(() {
          return layout.isWideScreen
              ? _buildWideLayout(layout)
              : _buildNarrowLayout(layout);
        });
      },
    );
  }

  Widget _buildWideLayout(LayoutRouter layout) {
    final leftPages = layout.logicalStack
        .where((e) => e.region == PageRegion.left)
        .toList();
    final rightPages = layout.logicalStack
        .where((e) => e.region == PageRegion.right)
        .toList();

    return Row(
      children: [
        Expanded(
          child: Navigator(
            key: layout.firstKey,
            pages: [
              if (leftPages.isEmpty)
                MaterialPage(
                  key: const ValueKey('home'),
                  child: RoutedPage(
                    pageKey: 'home',
                    region: PageRegion.left,
                    child: HomePage(region: PageRegion.left),
                  ),
                )
              else
                ...leftPages.map((item) => MaterialPage(
                  key: ValueKey(item.pageKey),
                  child: item.page,
                )),
            ],
            onPopPage: (route, result) {
              if (!route.didPop(result)) return false;
              layout.removePageFromStack(
                  route.settings.name ?? '', PageRegion.left);
              return true;
            },
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: Navigator(
            key: layout.secondKey,
            pages: [
              if (rightPages.isEmpty)
                MaterialPage(
                  key: const ValueKey('placeholder'),
                  child: const RoutedPage(
                    pageKey: 'placeholder',
                    region: PageRegion.right,
                    child: PlaceholderPage(title: 'Right Pane'),
                  ),
                )
              else
                ...rightPages.map((item) => MaterialPage(
                  key: ValueKey(item.pageKey),
                  child: item.page,
                )),
            ],
            onPopPage: (route, result) {
              if (!route.didPop(result)) return false;
              layout.removePageFromStack(
                  route.settings.name ?? '', PageRegion.right);
              return true;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(LayoutRouter layout) {
    final pages = layout.logicalStack.toList();

    return Navigator(
      key: layout.firstKey,
      pages: [
        if (pages.isEmpty)
          MaterialPage(
            key: const ValueKey('home'),
            child: RoutedPage(
              pageKey: 'home',
              region: PageRegion.left,
              child: HomePage(region: PageRegion.left),
            ),
          )
        else
          ...pages.map((item) => MaterialPage(
            key: ValueKey(item.pageKey),
            child: item.page,
          )),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        layout.removePageFromStack(route.settings.name ?? '', PageRegion.left);
        return true;
      },
    );
  }
}
