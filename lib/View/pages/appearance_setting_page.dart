import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';

class AppearanceSettingPage extends BaseRightRegionPage {
  const AppearanceSettingPage({super.key})
    : super(pageKey: 'settings/appearance');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Appearance")),
      body: Column(
        children: [
          const Center(child: Text("This is an appearance setting page")),
          ElevatedButton(
            onPressed: () {
              router.pushNamed('placeholder');
            },
            child: Text('Wrong child!'),
          ),
        ],
      ),
    );
  }
}
