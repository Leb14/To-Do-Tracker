import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';

class AccountSettingPage extends BaseRightRegionPage {
  const AccountSettingPage({super.key}) : super(pageKey: 'settings/account');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: const Center(child: Text("This is an account setting page")),
    );
  }
}
