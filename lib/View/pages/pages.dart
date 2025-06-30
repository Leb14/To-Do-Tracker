import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigation/router.dart';


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
                region: PageRegion.left,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ViewImagePage extends StatelessWidget {
  const ViewImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutRouter>();
    return Scaffold(
      appBar: AppBar(title: const Text('View Image')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            layout.push(
              const ImageDetailPage(),
              pageKey: 'imageDetail',
              region: PageRegion.right,
            );
          },
          child: const Text('Go to Detail'),
        ),
      ),
    );
  }
}

class ImageDetailPage extends StatelessWidget {
  const ImageDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Detail')),
      body: const Center(child: Text('Detail Info')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings...')),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text('Empty Pane')),
    );
  }
}
