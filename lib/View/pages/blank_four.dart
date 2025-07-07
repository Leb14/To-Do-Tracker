import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';

class FourthBlankPage extends BaseRightRegionPage {
  const FourthBlankPage({super.key}) : super(pageKey: 'settings/help/first-blank/second-blank/third-blank/fourth-blank');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blank 4")),
      body: const Column(
        children: [
          Center(child: Text("This is the fourth blank page")),
        ],
      ),
    );
  }
}
