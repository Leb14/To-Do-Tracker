import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';

class ViewImagePage extends BaseRightRegionPage {
  const ViewImagePage({super.key}) : super(pageKey: 'main/view-image');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                router.pushNamed('main/view-image/image-detail', parameters: {
                  'bg': Colors.pink,
                  'fg': Colors.black,
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.pink),
              ),
              child: const Text('Pink', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                router.pushNamed('main/view-image/image-detail', parameters: {
                  'bg': Colors.black,
                  'fg': Colors.white,
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
              ),
              child: const Text('Black', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                router.pushNamed('main/view-image/image-detail', parameters: {
                  'bg': Colors.yellow,
                  'fg': Colors.black,
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.yellow),
              ),
              child: const Text('Yellow', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
