import 'package:get/get.dart';

class ContentController extends GetxController {
  final RxString title = ''.obs;
  final RxString description = ''.obs;

  void showDescription(String newTitle, String newDescription) {
    title.value = newTitle;
    description.value = newDescription;
  }

  void clear() {
    title.value = '';
    description.value = '';
  }
}
