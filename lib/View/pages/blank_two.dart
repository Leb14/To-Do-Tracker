import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';
import 'package:untitled/View/pages/blank_three.dart';

class SecondBlankPage extends BaseRightRegionPage {
  const SecondBlankPage({super.key}) : super(pageKey: 'settings/help/first-blank/second-blank');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blank 2")),
      body: Column(
        children: [
          const Center(child: Text("This is the second blank page")),
          ElevatedButton(
            onPressed: () {
              router.pushPage(const ThirdBlankPage());
            },
            child: const Text('Go blank 3!'),
          ),
        ],
      ),
    );
  }
}
