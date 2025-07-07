part of '../../dual_pane_router.dart';

abstract class BaseRegionWidget {
  String get pageKey;
  PageRegion get region;
}

abstract class BaseRegionPage extends StatelessWidget implements BaseRegionWidget {
  @override
  final String pageKey;

  const BaseRegionPage({required this.pageKey, super.key});

  @override
  PageRegion get region;

  Widget buildPage(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return RoutedPage(
      pageKey: pageKey,
      region: region,
      child: buildPage(context),
    );
  }
}

abstract class BaseLeftRegionPage extends BaseRegionPage {
  const BaseLeftRegionPage({required super.pageKey, super.key});

  @override
  PageRegion get region => PageRegion.left;
}

abstract class BaseRightRegionPage extends BaseRegionPage {
  const BaseRightRegionPage({required super.pageKey, super.key});

  @override
  PageRegion get region => PageRegion.right;
}

abstract class BaseRegionStatefulPage extends StatefulWidget implements BaseRegionWidget {
  @override
  final String pageKey;

  const BaseRegionStatefulPage({required this.pageKey, super.key});

  @override
  PageRegion get region;
}

abstract class BaseLeftRegionStatefulPage extends BaseRegionStatefulPage {
  const BaseLeftRegionStatefulPage({required super.pageKey, super.key});

  @override
  PageRegion get region => PageRegion.left;
}

abstract class BaseRightRegionStatefulPage extends BaseRegionStatefulPage {
  const BaseRightRegionStatefulPage({required super.pageKey, super.key});

  @override
  PageRegion get region => PageRegion.right;
}
