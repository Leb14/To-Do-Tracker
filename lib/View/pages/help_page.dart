import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/pages/blank_one.dart';

class HelpPage extends BaseRightRegionPage {
  const HelpPage({super.key}) : super(pageKey: 'settings/help');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help")),
      body: Column(
        children: [
          const Center(child: Text("This is a help page")),
          ElevatedButton(
            onPressed: () {
              router.pushPage(
                const FirstBlankPage(),
              );
            },
            child: const Text('Go blank 1!'),
          ),
        ],
      ),
    );
  }
}
