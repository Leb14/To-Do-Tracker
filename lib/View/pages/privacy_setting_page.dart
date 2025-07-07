import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';

class PrivacySettingPage extends BaseRightRegionPage {
  const PrivacySettingPage({super.key}) : super(pageKey: 'settings/privacy');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy")),
      body: const Center(child: Text("This is a privacy setting page")),
    );
  }
}
