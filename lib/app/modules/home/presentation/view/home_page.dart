import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  void _changeBackgroundColor() {
    setState(() {
      _randomizeColor();
      _selectTextColor();
    });
  }

  void _randomizeColor() {
    var red = Random().nextInt(256);
    var green = Random().nextInt(256);
    var blue = Random().nextInt(256);

    _backgroundColor = Color.fromRGBO(red, green, blue, _defaultOpacity);
  }

  void _selectTextColor() {
    _textColor = _isBackgroundLuminanceLight()
        ? _blackTextColor
        : _lightTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Does not have an [AppBar] used [AnnotatedRegion] for the screen to change the status Bar brightness
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _isBackgroundLuminanceLight()
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: _changeBackgroundColor,
          child: Scaffold(
            backgroundColor: _backgroundColor,
            body: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                Text(
                  'Hello there!',
                  style: TextStyle(color: _textColor, fontSize: 32),
                ),
                HexColorDisplayWidget(
                  color: _backgroundColor,
                  isBright: _isBackgroundLuminanceLight(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Returns a boolean
  ///
  /// Represents the brightness of the background color, if it is dark or light.
  bool _isBackgroundLuminanceLight() {
    return _backgroundColor.computeLuminance() > 0.5;
  }
}

class HexColorDisplayWidget extends StatelessWidget {
  const HexColorDisplayWidget({
    required this.color,
    required this.isBright,
    super.key,
  });

  final Color color;
  final bool isBright;

  @override
  Widget build(BuildContext context) {
    final Color lightTextColor = Colors.white;
    final Color blackTextColor = Colors.black;

    // TODO: change to function
    String colorString =
        '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';

    return Row(
      mainAxisAlignment: .center,
      children: [
        Text(
          colorString,
          style: TextStyle(
            fontSize: 24,
            color: isBright ? blackTextColor : lightTextColor,
          ),
        ),
        const SizedBox(width: 2),
        IconButton(
          icon: Icon(
            Icons.copy,
            color: isBright ? blackTextColor : lightTextColor,
            size: 18,
          ),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: colorString));
          },
        ),
      ],
    );
  }
}
