// view_more_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/layout_controller.dart';

class ViewDetailPage extends StatelessWidget {
  const ViewDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("View More", style: layout.titleStyle),
      ),
      body: Center(
        child: Text("Here is more info about the button!", style: layout.contentStyle),
      ),
    );
  }
}
