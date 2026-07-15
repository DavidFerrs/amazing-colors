import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _lightTextColor = Colors.white;
  final Color _blackTextColor = Colors.black;
  final double _defaultOpacity = 1;

  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;

  void _randomizeColor() {
    var red = Random().nextInt(256);
    var green = Random().nextInt(256);
    var blue = Random().nextInt(256);

    _backgroundColor = Color.fromRGBO(red, green, blue, _defaultOpacity);
    _selectTextColor();
  }

  void _selectTextColor() {
    final luminance = _backgroundColor.computeLuminance();

    setState(() {
      if (luminance > 0.5) {
        _textColor = _blackTextColor;
      } else {
        _textColor = _lightTextColor;
      }
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
            child: Text(
              'Hello there!',
              style: TextStyle(color: _textColor, fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }
}
