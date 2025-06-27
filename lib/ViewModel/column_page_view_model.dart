import 'package:get/get.dart';
import 'package:untitled/controller/content_controller.dart';
import 'package:untitled/View/pages/desc_page.dart';
import 'package:untitled/View/navigation/router.dart';
import 'package:untitled/controller/selected_button_controller.dart';

import '../View/pages/extra_page.dart';


class ColumnPageViewModel {
  final ContentController _contentController = Get.find();
  final SelectedButtonController _selectedButtonController = Get.find();
  final LayoutRouter _layoutRouter = Get.find();

  RxString get selectedButton => _selectedButtonController.selectedButton;

  void onButtonPressed({
    required String id,
    required String title,
    required String description,
    required bool toFirstColumn,
  }) {
    _selectedButtonController.selectButton(id);
    _contentController.showDescription(title, description);

    // _layoutRouter.pushDescriptionIfNarrow(
    //   title: title,
    //   description: description,
    //   toFirstColumn: toFirstColumn,
    // );
  }

  void goToExtraPage({required bool toFirstColumn}) {
    _layoutRouter.push(
      const ExtraPage(),
      toFirstColumn: toFirstColumn,
    );
  }
}
