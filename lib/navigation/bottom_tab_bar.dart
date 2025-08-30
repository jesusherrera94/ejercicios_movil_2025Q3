import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../screens/home.dart';
import '../screens/store.dart';
import '../screens/profile.dart';

class MyBottomTabBar extends StatefulWidget {
  @override
  State<MyBottomTabBar> createState() => _MyBottomTabBarState();
}

class _MyBottomTabBarState extends State<MyBottomTabBar>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  ScrollController _scrollController = ScrollController();
  bool _isVisible = true;

  final List<Map<String, dynamic>> _screens = [
    {"title": "Home", "screen": HomeScreen()},
    {"title": "Store", "screen": StoreScreen()},
    {"title": "Profile", "screen": ProfileScreen()},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _offsetAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 1.0))
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!_isVisible) {
        _isVisible = true;
        _animationController.forward();
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (_isVisible) {
        _isVisible = false;
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

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
            child: Icon(Icons.add, color: Colors.white),
          )
        : null;
  }

  Widget _buildBodyWithScrollController() {
  switch (_selectedIndex) {
    case 0:
      return HomeScreen(scrollController: _scrollController);
    case 1:
      return StoreScreen(scrollController: _scrollController);
    case 2:
      return ProfileScreen();
    default:
      return HomeScreen(scrollController: _scrollController);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]["title"]),
        automaticallyImplyLeading: false, // esto nos va a servir en el futuro
      ),
      body: _buildBodyWithScrollController(),
      floatingActionButton: getFloatinActionButton(_selectedIndex),
      bottomNavigationBar: SlideTransition(
        position: _offsetAnimation,
        child: BottomNavigationBar(
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
      ),
    );
  }
}
