import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/layout_controller.dart';
import '../../controller/content_controller.dart';

class DescriptionPane extends StatelessWidget {
  const DescriptionPane({super.key});

  @override
  Widget build(BuildContext context) {
    final contentController = Get.find<ContentController>();

    return GetBuilder<LayoutController>(
      builder: (layout) {
        return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contentController.title.value,
              style: layout.titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              contentController.description.value,
              style: layout.contentStyle,
            ),
          ],
        ));
      },
    );
  }
}

