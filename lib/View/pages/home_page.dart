import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/enum/enum_page_region.dart';
import 'package:untitled/View/navigation/router.dart';
import 'package:untitled/View/pages/setting_page.dart';
import 'package:untitled/View/pages/view_image_page.dart';

class HomePage extends StatelessWidget {
  final PageRegion region;
  const HomePage({super.key, required this.region});

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutRouter>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('View Image'),
            onTap: () {
              layout.push(
                const ViewImagePage(),
                pageKey: 'viewImage',
                region: PageRegion.right,
              );
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              layout.push(
                const SettingsPage(),
                pageKey: 'settings',
                region: PageRegion.right,
              );
            },
          ),
        ],
      ),
    );
  }
}