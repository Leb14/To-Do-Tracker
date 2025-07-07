import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';

class NotificationSettingPage extends BaseRightRegionPage {
  const NotificationSettingPage({super.key}) : super(pageKey: 'settings/notification');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification")),
      body: const Center(child: Text("This is a notification setting page")),
    );
  }
}
