import 'package:dual_pane_router/dual_pane_router.dart';
import 'package:flutter/material.dart';
import 'package:untitled/View/pages/main_page.dart';
import 'package:untitled/View/pages/setting_page.dart';

class HomePage extends BaseLeftRegionStatefulPage {
  const HomePage({super.key}) : super(pageKey: 'home');

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _tabs = [MainPage(), SettingsPage()];

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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
