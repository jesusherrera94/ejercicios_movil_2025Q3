import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import '../screens/store.dart';

class TabControllerScreen extends StatelessWidget {

  const TabControllerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, 
    child: Scaffold(
      appBar: AppBar(
        title: const Text('My super tab app!'),
        bottom: const TabBar( tabs: [
        Tab(icon: Icon(Icons.home),),
        Tab(icon: Icon(Icons.shopping_cart),),
        Tab(icon: Icon(Icons.person),),
      ],),
      ),
      body: const TabBarView(children: [
        HomeScreen(),
        StoreScreen(),
        ProfileScreen()
      ]),
    ));
  }
  
}