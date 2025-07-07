import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/pages/placeholder_page.dart';
import 'View/pages/home_page.dart';
import 'View/route/route.dart';
import 'View/theme/dark_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LayoutRouter.instance.initialize(
    routes: appRoutes,
    left: const HomePage(),
    right: const PlaceholderPage(title: "Default Right"),
  );

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
      home: LayoutRouter.instance.home,
    );
  }
}
