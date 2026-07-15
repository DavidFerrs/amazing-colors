import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _defaultOpacity = 1;

  Color _backgroundColor = Colors.white;

  void _randomizeColor() {
    var red = Random().nextInt(256);
    var green = Random().nextInt(256);
    var blue = Random().nextInt(256);

    setState(() {
      _backgroundColor = Color.fromRGBO(red, green, blue, _defaultOpacity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: _randomizeColor,
        child: Scaffold(
          backgroundColor: _backgroundColor,
          body: Center(
            child: Text('Hello there!', style: TextStyle(fontSize: 32)),
          ),
        ),
      ),
    );
  }
}
