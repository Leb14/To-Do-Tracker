import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/pages.dart';
import '../pages/view_detail.dart';

enum PageRegion { left, right }

class NavigationItem {
  final Widget page;
  final String pageKey;
  final PageRegion region;
  final DateTime timestamp;

  NavigationItem({
    required this.page,
    required this.pageKey,
    required this.region,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

class LayoutRouter extends GetxService {
  final GlobalKey<NavigatorState> firstKey = GlobalKey();
  final GlobalKey<NavigatorState> secondKey = GlobalKey();

  bool _isTransitioningLayout = false;

  final RxBool _isWideScreen = false.obs;
  bool get isWideScreen => _isWideScreen.value;

  final List<NavigationItem> _logicalStack = [];

  List<NavigationItem> get logicalStack => List.unmodifiable(_logicalStack);

  @override
  void onInit() {
    super.onInit();
    _addInitialHomePageIfNeeded();
  }

  void setScreenWidth(bool isWide) {
    if (_isWideScreen.value != isWide) {
      _isWideScreen.value = isWide;
      _handleScreenSizeChange(isWide);
    }
  }

  void _addInitialHomePageIfNeeded() {
    if (_logicalStack.isEmpty) {
      final home = RoutedPage(
        pageKey: 'home',
        region: PageRegion.left,
        child: HomePage(region: PageRegion.left),
      );
      _logicalStack.add(NavigationItem(
        page: home,
        pageKey: 'home',
        region: PageRegion.left,
      ));
      debugPrint("🏠 Added initial HomePage to logical stack");
    }
  }

  void updateScreenSize(BuildContext context) {
    final wide = MediaQuery.of(context).size.width >= 600;
    if (_isWideScreen.value != wide) {
      _isWideScreen.value = wide;
      _handleScreenSizeChange(wide);
    }
  }

  void _handleScreenSizeChange(bool isWide) {
    if (isWide) {
      _splitWideStack();
    } else {
      _restoreNarrowStack();
    }
  }

  void _restoreNarrowStack() {
    _isTransitioningLayout = true;

    debugPrint("🔁 Merging into narrow layout...");

    // Clear first (main) navigator
    while (firstKey.currentState?.canPop() == true) {
      firstKey.currentState!.pop();
    }

    // Push all pages from logical stack into firstKey
    for (int i = 1; i < _logicalStack.length; i++) {
      debugPrint("📥 Rebuilding [${_logicalStack[i].pageKey}] into FIRST navigator (narrow)");
    }

    // Clear second (side) navigator just in case
    while (secondKey.currentState?.canPop() == true) {
      secondKey.currentState!.pop();
    }

    _isTransitioningLayout = false;

    printStack("Merged Stack (All regions):");
  }


  void _splitWideStack() {
    _isTransitioningLayout = true;

    debugPrint("🔀 Splitting into wide layout...");

    // Clear both navigator stacks
    while (firstKey.currentState?.canPop() == true) {
      firstKey.currentState!.pop();
    }
    while (secondKey.currentState?.canPop() == true) {
      secondKey.currentState!.pop();
    }

    // Rebuild from the logical stack into two navigators
    for (final item in _logicalStack) {
      final nav = item.region == PageRegion.left ? firstKey : secondKey;
      debugPrint("📥 Rebuilding [${item.pageKey}] into ${item.region.name.toUpperCase()} navigator");
    }

    _isTransitioningLayout = false;

    printStack("After split:");
  }


  void removePageFromStack(String pageKey, PageRegion region) {
    if (_isTransitioningLayout) {
      debugPrint("🛑 Skipped removing [$pageKey] from $region due to layout transition");
      return;
    }

    _logicalStack.removeWhere((e) => e.pageKey == pageKey && e.region == region);
    debugPrint("🗑️ Removed page [$pageKey] from $region");
    printStack("after remove");
  }

  void push(
      Widget page, {
        required String pageKey,
        required PageRegion region,
      }) {
    if (_isTransitioningLayout) return;

    if (_logicalStack.any((e) => e.pageKey == pageKey && e.region == region)) {
      debugPrint("⚠️ [$pageKey] already exists in $region stack, skipping push.");
      return;
    }

    final routed = RoutedPage(
      pageKey: pageKey,
      region: region,
      child: page,
    );

    final item = NavigationItem(page: routed, pageKey: pageKey, region: region);
    _logicalStack.add(item);

    final nav = isWideScreen
        ? (region == PageRegion.left ? firstKey : secondKey)
        : firstKey;

    debugPrint("📦 Pushing [$pageKey] to ${nav == firstKey ? 'FIRST' : 'SECOND'} navigator");
    nav.currentState?.push(MaterialPageRoute(builder: (_) => routed));

    printStack("after push");
  }




  void pop() {
    if (_logicalStack.isEmpty) return;

    final last = _logicalStack.removeLast();
    final nav = isWideScreen && last.region == PageRegion.right
        ? secondKey
        : firstKey;

    nav.currentState?.maybePop();

    // Check for duplicate key, remove both
    if (_logicalStack.isNotEmpty) {
      final prev = _logicalStack.last;
      if (prev.pageKey == last.pageKey) {
        _logicalStack.removeLast();
        final prevNav = isWideScreen && prev.region == PageRegion.right
            ? secondKey
            : firstKey;
        prevNav.currentState?.maybePop();
      }
    }

    printStack("after pop");
  }

  void printStack([String label = ""]) {
    final full = _logicalStack.map((e) => '${e.pageKey} (${e.region.name})').toList();

    debugPrint("⬛️ Stack $label");
    debugPrint("  🧠 Logical Stack: $full");
  }
}
