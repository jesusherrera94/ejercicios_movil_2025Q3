import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  String message = '';
  // Prop drilling
  Square({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Center(
        child: Text(message, style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white),),
      ),
    );
  }
}
