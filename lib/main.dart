import 'package:flutter/material.dart';
import 'square.dart';
import 'screens/login.dart';
import './navigation/bottom_tab_bar.dart';
import './navigation/tab_controller.dart';
import './navigation/drawer.dart';
import './screens/register.dart';
import './screens/create_subscription.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: 'init',
      routes: {
        "init": (context) => Login(),
        "main-app": (context) => MyBottomTabBar(),
        "register": (context) => Register(),
        "create-subscription": (context) => CreateSubscription(),
      },
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
