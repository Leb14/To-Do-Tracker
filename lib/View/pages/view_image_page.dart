import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/View/enum/enum_page_region.dart';
import 'package:untitled/View/navigation/router.dart';
import 'package:untitled/View/pages/image_detail_page.dart';

class ViewImagePage extends StatelessWidget {
  const ViewImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutRouter>();
    return Scaffold(
      appBar: AppBar(title: const Text('View Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                layout.pushNested(
                  pageKey: 'imageDetail',
                  region: PageRegion.right,
                  page: const ImageDetailPage(backgroundColor: Colors.pink, fontColor: Colors.black),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.pink),
              ),
              child: const Text('Pink', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                layout.pushNested(
                  pageKey: 'imageDetail',
                  region: PageRegion.right,
                  page: const ImageDetailPage(backgroundColor: Colors.black, fontColor: Colors.white),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
              ),
              child: const Text('Black', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                layout.pushNested(
                  pageKey: 'imageDetail',
                  region: PageRegion.right,
                  page: const ImageDetailPage(backgroundColor: Colors.yellow, fontColor: Colors.black),
                );
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
