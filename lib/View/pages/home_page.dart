import 'package:flutter/material.dart';
import 'package:untitled/View/enum/enum_page_region.dart';
import 'package:untitled/View/pages/main_page.dart';
import 'package:untitled/View/pages/setting_page.dart';
import 'package:untitled/View/pages/view_image_page.dart';

class HomePage extends StatefulWidget {
  final PageRegion region;
  const HomePage({super.key, required this.region});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _tabs = [
    MainPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
