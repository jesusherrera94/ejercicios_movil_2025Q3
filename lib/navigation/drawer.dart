import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/store.dart';
import '../screens/profile.dart';


class MenuDrawer extends StatefulWidget {

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    StoreScreen(),
    ProfileScreen(),
  ];

  void _onTabMenuItem(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My super app!"),
        leading: Builder(builder: (context) {
          return IconButton(onPressed: () {
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.menu));
        }),
      ),
      body: _screens[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Text("Drawer Header"),
            decoration: BoxDecoration(color: Colors.blueAccent),
            ),
            ListTile(
              title: Text("Home"),
              selected: _selectedIndex == 0,
              onTap: () {
                _onTabMenuItem(0);
                Navigator.pop(context); // cerrar el menu drawer!
              },
            ),
            ListTile(
              title: Text("Store"),
              selected: _selectedIndex == 1,
              onTap: () {
                _onTabMenuItem(1);
                Navigator.pop(context); // cerrar el menu drawer!
              },
            ),
            ListTile(
              title: Text("Profile"),
              selected: _selectedIndex == 2,
              onTap: () {
                _onTabMenuItem(2);
                Navigator.pop(context); // cerrar el menu drawer!
              },
            ),
          ],
        ),
      ),
    );
  }  


}
