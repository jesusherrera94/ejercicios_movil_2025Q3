import 'dart:async';

import 'package:flutter/material.dart';


class Counter extends StatefulWidget {

  @override
  State<Counter> createState() => _CounterState();
}


class _CounterState extends State<Counter> {

  late Timer _counterTimer;
  int _counter = 10;

  @override
  void initState() {
    super.initState();
    _initCounter();
  }

  void _initCounter() {
    _counterTimer = Timer.periodic(Duration(seconds: 1), (_){
      if(_counter == 0) {
        _counter = 10;
      } else {
        --_counter;
      }
      setState((){});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _counterTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_counter.toString(), style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
