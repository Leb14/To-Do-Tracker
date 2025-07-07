part of '../../dual_pane_router.dart';

class RouteNode {
  final String path;
  final BaseRegionWidget Function(Map<String, dynamic>? args) builder;
  final List<RouteNode> children;

  RouteNode({
    required this.path,
    required this.builder,
    this.children = const [],
  });
}
