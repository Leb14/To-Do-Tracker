import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';


class SettingsPage extends BaseLeftRegionPage {
  const SettingsPage({super.key}) : super(pageKey: 'settings');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Account'),
            onTap: () {
              router.pushNamed('settings/account');
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy'),
            onTap: () {
              router.pushNamed('settings/privacy');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              router.pushNamed('settings/notification');
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Appearance'),
            onTap: () {
              router.pushNamed('settings/appearance');
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: () {
              router.pushNamed('settings/help');
            },
          ),
        ],
      ),
    );
  }
}
