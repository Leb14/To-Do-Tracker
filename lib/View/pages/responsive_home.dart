import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../View/navigation/router.dart';
import '../../controller/layout_controller.dart';
import 'base_page.dart';
import 'column_page.dart';
import 'desc_page.dart';

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutController = Get.find<LayoutController>();
    final layout = Get.find<LayoutRouter>();

    return LayoutBuilder(
      builder: (context, constraints) {
        layoutController.updateSize(constraints.maxWidth);

        if (layoutController.isWide) {
          return Row(
            children: [
              Expanded(
                child: Navigator(
                  key: layout.firstKey,
                  onGenerateRoute: (_) => MaterialPageRoute(
                    builder: (_) => BasePage(
                      title: "Button",
                      child: ColumnPage(
                        label: "Left",
                        toFirst: true,
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: Navigator(
                  key: layout.secondKey,
                  onGenerateRoute: (_) => MaterialPageRoute(
                    builder: (_) => DescriptionPage(
                      title: 'Description',
                      description: 'Select something to view the description.',
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Navigator(
            key: layout.firstKey,
            onGenerateRoute: (_) => MaterialPageRoute(
              builder: (_) => BasePage(
                title: "Button",
                child: ColumnPage(
                  label: "Left",
                  toFirst: true,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
