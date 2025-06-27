import 'package:get/get.dart';

class SelectedButtonController extends GetxController {

  final selectedButton = ''.obs;

  void selectButton(String id) {
    selectedButton.value = id;
  }
}
