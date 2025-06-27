import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {
  final Widget defaultSecondScreen = Scaffold(
    body: Center(child: Text("Click a button!")),
  );

  Rxn<Widget> secondScreen = Rxn<Widget>();

  ScreenController() {
    secondScreen.value = defaultSecondScreen;
  }

  void updateSecondScreen(Widget newScreen) {
    secondScreen.value = newScreen;
  }

  void resetSecondScreen() {
    secondScreen.value = defaultSecondScreen;
  }
}
