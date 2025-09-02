import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/store.dart';
import '../screens/profile.dart';

class MyBottomTabBar extends StatefulWidget {
  @override
  State<MyBottomTabBar> createState() => _MyBottomTabBarState();
}

class _MyBottomTabBarState extends State<MyBottomTabBar> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _screens = [
    {"title": "Home", "screen": HomeScreen()},
    {"title": "Store", "screen": StoreScreen()},
    {"title": "Profile", "screen": ProfileScreen()},
  ];

  void _onTabItem(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

    Widget? getFloatinActionButton(int index) {
    // si el indice es 0(equivalente a home) retorna el Floating action button, sino retorna nulo
    return index == 0
        ? FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'create-subscription');
          },
          backgroundColor: Colors.blueAccent,
          shape: CircleBorder(), 
          child: Icon(Icons.add, color: Colors.white,))
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]["title"]),
        automaticallyImplyLeading: false, // esto nos va a servir en el futuro
      ),
      body: _screens[_selectedIndex]["screen"],
      floatingActionButton: getFloatinActionButton(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"), // 0
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Store",
          ), // 1
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ), // 2
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onTabItem,
      ),
    );
  }
}
