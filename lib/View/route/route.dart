import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:untitled/View/pages/account_setting_page.dart';
import 'package:untitled/View/pages/appearance_setting_page.dart';
import 'package:untitled/View/pages/blank_four.dart';
import 'package:untitled/View/pages/blank_one.dart';
import 'package:untitled/View/pages/blank_three.dart';
import 'package:untitled/View/pages/blank_two.dart';
import 'package:untitled/View/pages/help_page.dart';
import 'package:untitled/View/pages/image_detail_page.dart';
import 'package:untitled/View/pages/main_page.dart';
import 'package:untitled/View/pages/notification_setting_page.dart';
import 'package:untitled/View/pages/placeholder_page.dart';
import 'package:untitled/View/pages/privacy_setting_page.dart';
import 'package:untitled/View/pages/setting_page.dart';
import 'package:untitled/View/pages/view_image_page.dart';
import 'package:flutter/material.dart';

final List<RouteNode> appRoutes = [
  RouteNode(
    path: 'settings',
    builder: (_) => const SettingsPage(),
    children: [
      RouteNode(
        path: 'settings/appearance',
        builder: (_) => const AppearanceSettingPage(),
        children: [
          RouteNode(
            path: 'settings/appearance',
            builder: (_) => const AppearanceSettingPage(),
          ),
          RouteNode(
            path: 'settings/account',
            builder: (_) => const AccountSettingPage(),
          ),
          RouteNode(
            path: 'settings/help',
            builder: (_) => const HelpPage(),
            children: [
              RouteNode(
                path: 'settings/help/first-blank',
                builder: (_) => const FirstBlankPage(),
                children: [
                  RouteNode(
                    path: 'settings/help/first-blank/second-blank',
                    builder: (_) => const SecondBlankPage(),
                    children: [
                      RouteNode(
                        path: 'settings/help/first-blank/second-blank/third-blank',
                        builder: (_) => const ThirdBlankPage(),
                        children: [
                          RouteNode(
                            path: 'settings/help/first-blank/second-blank/third-blank/fourth-blank',
                            builder: (_) => const FourthBlankPage(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          RouteNode(
            path: 'settings/privacy',
            builder: (_) => const PrivacySettingPage(),
          ),
          RouteNode(
            path: 'settings/notification',
            builder: (_) => const NotificationSettingPage(),
          ),
        ]
      ),
      RouteNode(
        path: 'settings/account',
        builder: (_) => const AccountSettingPage(),
      ),
      RouteNode(
        path: 'settings/help',
        builder: (_) => const HelpPage(),
        children: [
          RouteNode(
            path: 'settings/help/first-blank',
            builder: (_) => const FirstBlankPage(),
            children: [
              RouteNode(
                path: 'settings/help/first-blank/second-blank',
                builder: (_) => const SecondBlankPage(),
                children: [
                  RouteNode(
                    path: 'settings/help/first-blank/second-blank/third-blank',
                    builder: (_) => const ThirdBlankPage(),
                    children: [
                      RouteNode(
                        path: 'settings/help/first-blank/second-blank/third-blank/fourth-blank',
                        builder: (_) => const FourthBlankPage(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      RouteNode(
        path: 'settings/privacy',
        builder: (_) => const PrivacySettingPage(),
      ),
      RouteNode(
        path: 'settings/notification',
        builder: (_) => const NotificationSettingPage(),
      ),
    ],
  ),
  RouteNode(
    path: 'main',
    builder: (_) => const MainPage(),
    children: [
      RouteNode(
        path: 'main/view-image',
        builder: (_) => const ViewImagePage(),
        children: [
          RouteNode(
            path: 'main/view-image/image-detail',
            builder:
                (params) => ImageDetailPage(
                  backgroundColor: params?['bg'] ?? Colors.black,
                  fontColor: params?['font'] ?? Colors.white,
                ),
          ),
        ],
      ),
    ],
  ),
  RouteNode(
    path: 'placeholder',
    builder: (_) => PlaceholderPage(title: 'Test route'),
  ),
];
