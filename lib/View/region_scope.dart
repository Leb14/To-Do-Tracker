import 'package:flutter/material.dart';
import 'package:untitled/View/enum/enum_page_region.dart';

class RegionScope extends InheritedWidget {
  final PageRegion region;

  const RegionScope({
    required this.region,
    required super.child,
    super.key,
  });

  static PageRegion? of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<RegionScope>();
    return scope?.region;
  }

  @override
  bool updateShouldNotify(RegionScope oldWidget) => region != oldWidget.region;
}
