import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';

class ImageDetailPage extends BaseRightRegionPage {
  final Color backgroundColor;
  final Color fontColor;

  const ImageDetailPage({
    super.key,
    required this.backgroundColor,
    required this.fontColor,
  }) : super(
    pageKey: '/view-image/image-detail',
  );

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: const Text('Image Detail')),
      body: Center(
        child: Text(
          'Detail Info',
          style: TextStyle(color: fontColor),
        ),
      ),
    );
  }
}
