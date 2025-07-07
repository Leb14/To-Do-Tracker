library dual_pane_router;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'controller/layout_controller.dart';

part 'base/base_region.dart';

part 'config/layout_config.dart';

part 'navigation/router.dart';
part 'navigation/route_node.dart';
part 'navigation/routed_page.dart';

part 'ui/responsive_home.dart';

part 'enum/enum_page_region.dart';

final LayoutRouter router = LayoutRouter.instance;