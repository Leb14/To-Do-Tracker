part of '../../dual_pane_router.dart';

class LayoutRouter extends GetxService {
  static final LayoutRouter instance = LayoutRouter._internal();
  LayoutRouter._internal();

  // Public home widget
  Widget get home => const ResponsiveHomePage();

  // Dependencies
  late LayoutController layoutController;

  // Configuration
  late List<RouteNode> _routes;
  late BaseRegionWidget leftHome;
  late BaseRegionWidget rightDefault;

  // Initialization state
  bool _initialized = false;
  bool _isTransitioningLayout = false;
  bool? _lastLayoutWide;

  // Navigator keys
  final GlobalKey<NavigatorState> rightKey = GlobalKey();
  final GlobalKey<NavigatorState> secondKey = GlobalKey();

  // Stack state
  final RxMap<PageRegion, RxList<BaseRegionWidget>> _regionStacks = {
    PageRegion.left: <BaseRegionWidget>[].obs,
    PageRegion.right: <BaseRegionWidget>[].obs,
  }.obs;

  List<BaseRegionWidget> get logicalStack => [
    ..._regionStacks[PageRegion.left]!,
    ..._regionStacks[PageRegion.right]!,
  ];

  bool get isWideScreen => layoutController.isWide;

  // 📦 Initialization
  void initialize({
    required List<RouteNode> routes,
    required BaseRegionWidget left,
    required BaseRegionWidget right,
  }) {
    if (_initialized) return;

    if (!Get.isRegistered<LayoutController>()) {
      Get.put(LayoutController());
    }

    layoutController = Get.find<LayoutController>();
    Get.put(LayoutRouter.instance);

    _routes = routes;
    leftHome = left;
    rightDefault = right;
    _initialized = true;

    _addInitialHomePages();
    debugPrint("🚀 LayoutRouter initialized");
  }

  void _addInitialHomePages() {
    if (_regionStacks[PageRegion.left]!.isEmpty) {
      _regionStacks[PageRegion.left]!.add(leftHome);
      debugPrint("🏠 Added leftHome to left stack");
    }
    if (_regionStacks[PageRegion.right]!.isEmpty) {
      _regionStacks[PageRegion.right]!.add(rightDefault);
      debugPrint("📥 Added rightDefault to right stack");
    }
  }

  // 🔄 Layout Handling
  void handleLayoutChangeIfNeeded() {
    final current = isWideScreen;
    if (_lastLayoutWide == null || _lastLayoutWide != current) {
      _lastLayoutWide = current;
      debugPrint("🔄 Layout changed to ${current ? 'WIDE' : 'NARROW'}");
      _handleScreenSizeChange(current);
    }
  }

  void _handleScreenSizeChange(bool isWide) {
    _isTransitioningLayout = true;
    _clearNavigators();

    if (isWide) {
      _splitWideStack();
    } else {
      _mergeToNarrowStack();
    }

    _isTransitioningLayout = false;
  }

  void _clearNavigators() {
    while (rightKey.currentState?.canPop() == true) {
      rightKey.currentState!.pop();
    }
    while (secondKey.currentState?.canPop() == true) {
      secondKey.currentState!.pop();
    }
  }

  void _mergeToNarrowStack() {
    debugPrint("🔁 Merging into narrow layout...");
    printStack("Merged Stack");
  }

  void _splitWideStack() {
    debugPrint("🔀 Splitting into wide layout...");

    if (_regionStacks[PageRegion.right]!.isEmpty) {
      _regionStacks[PageRegion.right]!.add(rightDefault);
      debugPrint("🧩 Added rightDefault to right stack");
    }

    printStack("After split");
  }

  // 🧭 Navigation
  void pushPage(BaseRegionWidget page) {
    final region = page.region;
    final stack = _regionStacks[region]!;

    if (stack.any((item) => item.pageKey == page.pageKey)) {
      debugPrint("⚠️ Page ${page.pageKey} already exists in $region. Skipping.");
      return;
    }

    stack.add(page);
    _regionStacks.refresh();

    debugPrint("📦 Pushed ${page.pageKey} to $region");
    printStack("After push");
  }

  void pop(PageRegion region) {
    final stack = _regionStacks[region]!;
    if (stack.isEmpty) return;

    final last = stack.removeLast();
    _regionStacks.refresh();

    debugPrint("🔙 Popped ${last.pageKey} from $region");
    printStack("After pop");
  }

  void removePageFromStack(String pageKey, PageRegion region) {
    if (_isTransitioningLayout) {
      debugPrint("⚠️ Skipped removing [$pageKey] during layout transition");
      return;
    }

    _regionStacks[region]!.removeWhere((e) => e.pageKey == pageKey);
    _regionStacks.refresh();

    debugPrint("🗑️ Removed [$pageKey] from $region");
    printStack("After remove");
  }

  void pushNamed(String path, {Map<String, dynamic>? parameters}) {
    final node = _findRouteByPath(_routes, path);
    if (node == null) {
      debugPrint("❌ Route not found: $path");
      return;
    }

    final page = node.builder(parameters);

    final region = page.region;
    final stack = _regionStacks[region]!;

    if (stack.isNotEmpty) {
      final currentTopKey = stack.last.pageKey;
      final normalizedTop = currentTopKey.replaceAll(RegExp(r'^/+|/+$'), '');
      final normalizedNew = path.replaceAll(RegExp(r'^/+|/+$'), '');

      final isChild = normalizedNew.startsWith('$normalizedTop/')
          && normalizedNew != normalizedTop;

      if (!isChild && normalizedTop != normalizedNew) {
        debugPrint("⛔️ Blocked navigation: [$path] is not a child of [$currentTopKey]");
        return; // ❌ Cancel navigation
      }

      // Optional: clear stack if switching branches under same parent
      if (!normalizedNew.startsWith('$normalizedTop/')) {
        stack.clear();
        debugPrint("🧹 Cleared $region stack for new branch $normalizedNew");
      }
    }

    pushPage(page);
  }

  RouteNode? _findRouteByPath(List<RouteNode> nodes, String path) {
    final normalizedInputPath = path.replaceAll(RegExp(r'^/+|/+$'), '');

    for (final node in nodes) {
      final nodePath = node.path.replaceAll(RegExp(r'^/+|/+$'), '');

      if (nodePath == normalizedInputPath) return node;

      final child = _findRouteByPath(node.children, path);
      if (child != null) return child;
    }

    return null;
  }

  // 🧪 Debug
  void printStack([String label = ""]) {
    final left = _regionStacks[PageRegion.left]!
        .map((e) => '${e.pageKey} (L)')
        .join(', ');
    final right = _regionStacks[PageRegion.right]!
        .map((e) => '${e.pageKey} (R)')
        .join(', ');

    debugPrint("⬛️ Stack $label");
    debugPrint("  🔹 Left: [$left]");
    debugPrint("  🔸 Right: [$right]");
  }
}
