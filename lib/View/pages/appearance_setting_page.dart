import 'package:flutter/material.dart';

class AppearanceSettingPage extends StatelessWidget {
  const AppearanceSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appearance")),
      body: Center(child: Text("This is a appearance setting page")),
    );
  }
}
