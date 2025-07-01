import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  final Color backgroundColor;
  final Color fontColor;

  const ImageDetailPage({
    super.key,
    required this.backgroundColor,
    required this.fontColor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: const Text('Image Detail')),
      body: Center(child: Text('Detail Info', style: TextStyle(color: fontColor),)),
    );
  }
}
