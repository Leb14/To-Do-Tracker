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
        child: ElevatedButton(
          onPressed: () {
            layout.pushNested(
              pageKey: 'imageDetail',
              region: PageRegion.right,
              page: const ImageDetailPage(),
            );
          },
          child: const Text('Go to Detail'),
        ),
      ),
    );
  }
}
