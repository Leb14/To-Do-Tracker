part of '../../dual_pane_router.dart';

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = Get.find<LayoutRouter>();
    final layoutController = Get.find<LayoutController>();

    debugPrint("🔄 ResponsiveHomePage.build called");

    return LayoutBuilder(
      builder: (context, constraints) {
        layoutController.updateSize(constraints.maxWidth);
        router.handleLayoutChangeIfNeeded();
        final isWide = layoutController.isWide;

        return isWide ? _buildWideLayout(router) : _buildNarrowLayout(router);
      },
    );
  }

  Widget _buildWideLayout(LayoutRouter layout) {
    return Row(
      children: [
        Expanded(flex: 2, child: _buildNavigator(layout, PageRegion.left)),
        const VerticalDivider(width: 1),
        Expanded(flex: 3, child: _buildNavigator(layout, PageRegion.right)),
      ],
    );
  }

  Widget _buildNarrowLayout(LayoutRouter layout) {
    return _buildNavigator(layout, PageRegion.left, useMergedStack: true);
  }

  Widget _buildNavigator(
    LayoutRouter layout,
    PageRegion region, {
    bool useMergedStack = false,
  }) {
    return Obx(() {
      final pages =
          useMergedStack
              ? layout.logicalStack
              : layout.logicalStack.where((e) => e.region == region).toList();

      final pageList =
          // pageListpages.isEmpty && region == PageRegion.right
          //     ? [
          //       const MaterialPage(
          //         key: ValueKey('placeholder'),
          //         child: RoutedPage(
          //           pageKey: 'placeholder',
          //           region: PageRegion.right,
          //           child: PlaceholderPage(title: 'Right Pane'),
          //         ),
          //       ),
          //     ]
          pages
              .map(
                (item) => MaterialPage(
                  key: ValueKey(item.pageKey),
                  child: item as Widget,
                ),
              )
              .toList();

      final navKey =
          (region == PageRegion.left) ? layout.rightKey : layout.secondKey;

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

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
