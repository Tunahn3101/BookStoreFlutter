import 'package:flutter/material.dart';

import 'my_bookmark.dart';
import 'my_cart_screen.dart';
import 'homepage/my_home_screen.dart';
import 'my_settings_screen.dart';

class UIBottomNavigation extends StatefulWidget {
  const UIBottomNavigation({super.key});

  @override
  State<UIBottomNavigation> createState() => _UIBottomNavigationState();
}

class _UIBottomNavigationState extends State<UIBottomNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const MyHomeScreen(),
    const MyBookMark(),
    const MyCartScreen(),
    const MySettingsScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
                backgroundColor: Colors.amber,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_outline,
                ),
                label: 'Bookmark',
                backgroundColor: Colors.pink,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                label: 'Cart',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                ),
                label: 'Settings',
                backgroundColor: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
