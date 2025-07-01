import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  final Color backgroundColor;

  const ImageDetailPage({
    super.key,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: const Text('Image Detail')),
      body: const Center(child: Text('Detail Info')),
    );
  }
}
