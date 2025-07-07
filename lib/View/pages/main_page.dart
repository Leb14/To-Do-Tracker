import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';

class MainPage extends BaseLeftRegionPage {
  const MainPage({super.key}) : super(pageKey: 'main');

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            router.pushNamed('main/view-image');
          },
          child: const Text("View Image"),
        ),
      ),
    );
  }
}
