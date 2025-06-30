import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/enum/enum_page_region.dart';
import 'package:untitled/View/navigation/navigation_item.dart';
import 'package:untitled/View/pages/home_page.dart';
import 'package:untitled/View/navigation/routed_page.dart';
import 'package:untitled/controller/layout_controller.dart';

class LayoutRouter extends GetxService {
  final GlobalKey<NavigatorState> firstKey = GlobalKey();
  final GlobalKey<NavigatorState> secondKey = GlobalKey();

  final LayoutController layoutController = Get.find<LayoutController>();

  bool get isWideScreen => layoutController.isWide;
  bool _isTransitioningLayout = false;

  final RxMap<PageRegion, RxList<NavigationItem>> _regionStacks = {
    PageRegion.left: <NavigationItem>[].obs,
    PageRegion.right: <NavigationItem>[].obs,
  }.obs;

  List<NavigationItem> get logicalStack {
    final merged = <NavigationItem>[];
    final all = [
      ..._regionStacks[PageRegion.left]!,
      ..._regionStacks[PageRegion.right]!,
    ];

    final grouped = <DateTime, List<NavigationItem>>{};
    for (final item in all) {
      grouped.putIfAbsent(item.groupId, () => []).add(item);
    }

    final sortedKeys = grouped.keys.toList()..sort();
    for (final key in sortedKeys) {
      merged.addAll(grouped[key]!);
    }

    return merged;
  }

  @override
  void onInit() {
    super.onInit();
    _addInitialHomePageIfNeeded();
  }

  bool? _lastLayoutWide;

  void handleLayoutChangeIfNeeded() {
    final current = isWideScreen;
    if (_lastLayoutWide == null || _lastLayoutWide != current) {
      _lastLayoutWide = current;
      debugPrint("🔄 Layout changed to ${current ? 'WIDE' : 'NARROW'}");
      _handleScreenSizeChange(current);
    }
  }

  void _handleScreenSizeChange(bool isWide) {
    if (isWide) {
      _splitWideStack();
    } else {
      _restoreNarrowStack();
    }
  }

  void _clearNavigators() {
    while (firstKey.currentState?.canPop() == true) {
      firstKey.currentState!.pop();
    }
    while (secondKey.currentState?.canPop() == true) {
      secondKey.currentState!.pop();
    }
  }

  void _restoreNarrowStack() {
    _isTransitioningLayout = true;
    debugPrint("🔁 Merging into narrow layout...");
    _clearNavigators();
    _isTransitioningLayout = false;
    printStack("Merged Stack (Sorted)");
  }

  void _splitWideStack() {
    _isTransitioningLayout = true;
    debugPrint("🔀 Splitting into wide layout...");
    _clearNavigators();
    _isTransitioningLayout = false;
    printStack("After split");
  }

  void _addInitialHomePageIfNeeded() {
    if (_regionStacks[PageRegion.left]!.isEmpty &&
        _regionStacks[PageRegion.right]!.isEmpty) {
      final home = RoutedPage(
        pageKey: 'home',
        region: PageRegion.left,
        child: HomePage(region: PageRegion.left),
      );
      final now = DateTime.now();
      _regionStacks[PageRegion.left]!.add(
        NavigationItem(
          page: home,
          pageKey: 'home',
          region: PageRegion.left,
          pushedAt: now,
          groupId: now,
        ),
      );
      debugPrint("🏠 Added initial HomePage to left stack");
    }
  }

  void removePageFromStack(String pageKey, PageRegion region) {
    if (_isTransitioningLayout) {
      debugPrint("⚠️ Skipped removing [$pageKey] from $region due to layout transition");
      return;
    }
    _regionStacks[region]!.removeWhere((e) => e.pageKey == pageKey);
    _regionStacks.refresh();
    debugPrint("🗑️ Removed page [$pageKey] from $region");
    printStack("after remove");
  }

  void push(
      Widget page, {
        required String pageKey,
        required PageRegion region,
        DateTime? groupId,
      }) {
    groupId ??= DateTime.now();
    final routed = RoutedPage(pageKey: pageKey, region: region, child: page);

    _regionStacks[region]!.add(
      NavigationItem(
        page: routed,
        pageKey: pageKey,
        region: region,
        pushedAt: DateTime.now(),
        groupId: groupId,
      ),
    );
    _regionStacks.refresh();
    debugPrint("📦 Added [$pageKey] to $region stack");
    printStack("after push");
  }

  void pushNested({
    required Widget page,
    required String pageKey,
    required PageRegion region,
  }) {
    final groupId = getLastGroupIdForRegion(region);
    push(page, pageKey: pageKey, region: region, groupId: groupId);
  }

  DateTime getLastGroupIdForRegion(PageRegion region) {
    final stack = _regionStacks[region];
    return (stack == null || stack.isEmpty) ? DateTime.now() : stack.last.groupId;
  }

  void pop(PageRegion region) {
    final stack = _regionStacks[region]!;
    if (stack.isEmpty) return;
    final last = stack.removeLast();
    _regionStacks.refresh();
    debugPrint("🔙 Popped ${last.pageKey} from $region");
    printStack("after pop");
  }

  void printStack([String label = ""]) {
    final left = _regionStacks[PageRegion.left]!
        .map((e) => '${e.pageKey} (L)')
        .join(', ');
    final right = _regionStacks[PageRegion.right]!
        .map((e) => '${e.pageKey} (R)')
        .join(', ');
    final merged = logicalStack
        .map((e) => '${e.pageKey} (${e.region.name})')
        .join(', ');

    debugPrint("⬛️ Stack $label");
    debugPrint("  🔹 Left: [$left]");
    debugPrint("  🔸 Right: [$right]");
    debugPrint("  🧠 Merged: [$merged]");
  }
}
