import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import '../screens/store.dart';

class MyBottomTabBar extends StatefulWidget {

  @override
  State<MyBottomTabBar> createState() => _MyBottomTabBarState(); 
}

class _MyBottomTabBarState extends State<MyBottomTabBar> {

  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _screens = [
    {
      "title": 'Home',
      "screen": HomeScreen()
    },
    {
      "title": 'Store',
      "screen": StoreScreen()
    },
    {
      "title": 'Profile',
      "screen": ProfileScreen()
    }
  ];

  void _selectedNewIndex (int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  Widget? getFoatingActionButton(int index) {
    if(index == 0) {
      return FloatingActionButton(onPressed: () {}, child: Icon(Icons.add),);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]["title"]),
        automaticallyImplyLeading: false, // esto para el futuro!
      ),
      body: _screens[_selectedIndex]['screen'],
      floatingActionButton: getFoatingActionButton(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), // 0
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Store'), // 1
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'), // 2
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueAccent,
      onTap: _selectedNewIndex,
      ),
    );
  }

}