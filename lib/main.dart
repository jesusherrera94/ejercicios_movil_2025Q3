import 'package:flutter/material.dart';
import 'square.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Login(),
    );
  }
}


class InitialWidget extends StatelessWidget {
  String parentMessage = 'Hola mundo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My first app!"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: 'Other message',),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: 'Other message',),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: 'Other message',),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: 'Other message',),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: 'Other message',),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: parentMessage,),
              Square(message: 'Other message',),
            ],
          )
        ],
      ),
    );
  }
}
