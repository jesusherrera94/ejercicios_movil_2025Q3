import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/store.dart';
import '../screens/profile.dart';

class TabControllerScreen extends StatelessWidget {
  
  @override
  Widget build(Object context) {
   return DefaultTabController(length: 3, 
   child: Scaffold(
      appBar: AppBar(
        title: const Text("My super app!"),
        bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.home),),
          Tab(icon: Icon(Icons.shopping_cart),),
          Tab(icon: Icon(Icons.person),),
        ]),
      ),
      // aqui van las pantallas
      body: TabBarView(children: [
        HomeScreen(),
        StoreScreen(),
        ProfileScreen()
      ]),
   )); 
  }
  
}
