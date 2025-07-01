import 'package:flutter/material.dart';

class PrivacySettingPage extends StatelessWidget {
  const PrivacySettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Privacy")),
      body: Center(child: Text("This is a privacy setting page")),
    );
  }
}
