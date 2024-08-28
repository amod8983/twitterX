import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onIndexChange;
  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onIndexChange,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onIndexChange,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.search_off),
            activeIcon: Icon(Icons.search),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_alt_outlined),
            activeIcon: Icon(Icons.keyboard_alt),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            activeIcon: Icon(Icons.group),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.email_outlined),
            activeIcon: Icon(Icons.email),
            label: ''),
      ],
    );
  }
}
