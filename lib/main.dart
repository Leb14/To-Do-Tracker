import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/home_screen.dart';

import 'ViewModel/task_view_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(TaskViewModel());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
