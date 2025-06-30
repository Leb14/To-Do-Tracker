import 'package:flutter/material.dart';
import 'package:untitled/View/enum/enum_page_region.dart';
import 'package:untitled/View/navigation/routed_page.dart';

class NavigationItem {
  final RoutedPage page;
  final String pageKey;
  final PageRegion region;
  final DateTime pushedAt;
  final DateTime groupId; // 🆕 追加分组时间（用于合并逻辑）

  NavigationItem({
    required this.page,
    required this.pageKey,
    required this.region,
    required this.pushedAt,
    required this.groupId,
  });
}
