import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/enum/enum_page_region.dart';
import 'package:untitled/View/navigation/router.dart';
import 'package:untitled/View/pages/view_image_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = Get.find<LayoutRouter>();

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            router.push(
              const ViewImagePage(),
              region: PageRegion.right,
              pageKey: 'viewImage',
            );
          },
          child: Text("View Image"),
        ),
      ),
    );
  }
}
