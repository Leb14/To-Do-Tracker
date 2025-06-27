// lib/View/pages/extra_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ViewModel/column_page_view_model.dart';
import '../../controller/layout_controller.dart';

class ExtraPage extends StatelessWidget {
  const ExtraPage({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutController = Get.find<LayoutController>();
    final viewModel = ColumnPageViewModel();

    final titleStyle = layoutController.titleStyle;
    final spacing = layoutController.isWide ? 40.0 : 20.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Extra Page', style: layoutController.titleStyle),
      ),
      body: Obx(() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                viewModel.onButtonPressed(
                  id: 'button3',
                  title: 'Button 3',
                  description: 'This is the description for Button 3.',
                  toFirstColumn: false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: viewModel.selectedButton.value == 'button3'
                    ? Colors.green
                    : null,
              ),
              child: Text('Button 3', style: titleStyle),
            ),
            SizedBox(height: spacing),
            ElevatedButton(
              onPressed: () {
                viewModel.onButtonPressed(
                  id: 'button4',
                  title: 'Button 4',
                  description: 'This is the description for Button 4.',
                  toFirstColumn: false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: viewModel.selectedButton.value == 'button4'
                    ? Colors.yellow
                    : null,
              ),
              child: Text('Button 4', style: titleStyle),
            ),
            SizedBox(height: spacing),
            ElevatedButton(
              onPressed: () {
                viewModel.onButtonPressed(
                  id: 'button5',
                  title: 'Button 5',
                  description: 'This is the description for Button 5.',
                  toFirstColumn: false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: viewModel.selectedButton.value == 'button5'
                    ? Colors.orange
                    : null,
              ),
              child: Text('Button 5', style: titleStyle),
            ),
          ],
        ),
      ))
    );
  }
}
