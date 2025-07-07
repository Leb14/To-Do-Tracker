import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';
import 'package:untitled/View/pages/blank_two.dart';

class FirstBlankPage extends BaseRightRegionPage {
  const FirstBlankPage({super.key}) : super(pageKey: 'settings/help/first-blank');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blank 1")),
      body: Column(
        children: [
          const Center(child: Text("This is the first blank page")),
          ElevatedButton(
            onPressed: () {
              router.pushPage(const SecondBlankPage());
            },
            child: const Text('Go blank 2!'),
          ),
        ],
      ),
    );
  }
}
