import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/navigation/router.dart';
import 'package:untitled/View/pages/account_setting_page.dart';
import 'package:untitled/View/pages/appearance_setting_page.dart';
import 'package:untitled/View/pages/notification_setting_page.dart';
import 'package:untitled/View/pages/privacy_setting_page.dart';
import 'package:untitled/View/region_scope.dart';

import '../enum/enum_page_region.dart';
import 'help_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = Get.find<LayoutRouter>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Account'),
            onTap: () {
              router.push(
                const AccountSettingPage(),
                pageKey: 'account',
                region: PageRegion.right,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy'),
            onTap: () {
              router.push(
                const PrivacySettingPage(),
                pageKey: 'privacy',
                region: PageRegion.right,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              router.push(
                const NotificationSettingPage(),
                pageKey: 'notification',
                region: PageRegion.right,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Appearance'),
            onTap: () {
              router.push(
                const AppearanceSettingPage(),
                pageKey: 'appearance',
                region: PageRegion.right,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: () {
              final region = RegionScope.of(context);

              router.push(
                const HelpPage(),
                pageKey: 'help',
                region: PageRegion.right,
              );
            },
          ),
        ],
      ),
    );
  }
}
