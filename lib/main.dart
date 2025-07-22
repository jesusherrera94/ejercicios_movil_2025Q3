import 'package:flutter/material.dart';
import 'square.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My first App"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Square(message: 'Hello world!'),
              Square(message: 'Hello world!'),
              Square(message: 'Hello world!'),
              Square(message: 'Hello world!'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Square(message: 'Hello world!'),
              Square(message: 'Hello world!'),
              Square(message: 'Hello world!'),
              Square(message: 'Hello world!'),
            ],
          )
        ],
      ),
    );
  }
}