import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/pages/responsive_home.dart';
import 'package:untitled/controller/content_controller.dart';
import 'package:untitled/controller/layout_controller.dart';
import 'package:untitled/controller/selected_button_controller.dart';

import 'View/navigation/router.dart';
import 'View/theme/dark_theme.dart';
import 'controller/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LayoutController());
  Get.put(LayoutRouter());

  // Get.put(ScreenController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: customDarkTheme,
      home: const ResponsiveHomePage(),
    );
  }
}
