import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';

class PlaceholderPage extends BaseRightRegionPage {
  final String title;

  const PlaceholderPage({super.key, required this.title}) : super(pageKey: 'placeholder');

  @override
  String get pageKey => 'placeholder_$title';

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text('Empty Pane')),
    );
  }
}
