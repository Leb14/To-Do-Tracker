import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';
import 'package:untitled/View/pages/blank_four.dart';

class ThirdBlankPage extends BaseRightRegionPage {
  const ThirdBlankPage({super.key}) : super(pageKey: 'settings/help/first-blank/second-blank/third-blank');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blank 3")),
      body: Column(
        children: [
          const Center(child: Text("This is the third blank page")),
          ElevatedButton(
            onPressed: () {
              router.pushPage(const FourthBlankPage());
            },
            child: const Text('Go blank 4!'),
          ),
        ],
      ),
    );
  }
}
