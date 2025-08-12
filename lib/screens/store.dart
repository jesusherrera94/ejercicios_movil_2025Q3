import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 5,
      mainAxisSpacing: 10,
      children: [
        Container(
          color: Colors.amber,
          child: Center(child: Text("Hola mundo!1")),
        ),
        Container(
          color: Colors.amber,
          child: Center(child: Text("Hola mundo!1")),
        ),
        Container(
          color: Colors.amber,
          child: Center(child: Text("Hola mundo!1")),
        ),
        Container(
          color: Colors.amber,
          child: Center(child: Text("Hola mundo!1")),
        ),
        Container(
          color: Colors.amber,
          child: Center(child: Text("Hola mundo!1")),
        ),
        Container(
          color: Colors.amber,
          child: Center(child: Text("Hola mundo!1")),
        ),
        Container(
          color: Colors.amber,
          child: Center(child: Text("Hola mundo!1")),
        ),
        Container(
          color: Colors.amber,
          child: Center(child: Text("Hola mundo!1")),
        ),
      ],
    );
  }
}
