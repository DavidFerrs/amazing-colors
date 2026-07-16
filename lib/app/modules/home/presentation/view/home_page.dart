import 'dart:math';

import 'package:amazing_colors/app/core/styles/app_colors.dart';
import 'package:amazing_colors/app/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The main screen of the application.
///
/// Displays a tap-to-change random background color. It automatically adjusts
/// the system UI overlay (status bar) and text colors to maintain contrast and 
/// readability.
class HomePage extends StatefulWidget {
  /// Creates a [HomePage].
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _lightTextColor = AppColors.plainWhite;
  final Color _blackTextColor = AppColors.plainBlack;
  final double _defaultOpacity = 1;
  final double _defaultBrightness = 0.5;

  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;

  void _changeBackgroundColor() {
    setState(() {
      _randomizeColor();
      _selectTextColor();
    });
  }

  void _randomizeColor() {
    final red = Random().nextInt(256);
    final green = Random().nextInt(256);
    final blue = Random().nextInt(256);

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
      /// Does not have an [AppBar] used [AnnotatedRegion] for the screen to
      /// change the status Bar brightness
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _isBackgroundLuminanceLight()
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: _changeBackgroundColor,
          child: Scaffold(
            body: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: _backgroundColor,
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    'Hello there!',
                    style: AppTextStyle.carterOneRegular.copyWith(
                      color: _textColor,
                    ),
                  ),
                  _HexColorDisplayWidget(
                    color: _backgroundColor,
                    isBright: _isBackgroundLuminanceLight(),
                  ),
                ],
              ),
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
    return _backgroundColor.computeLuminance() > _defaultBrightness;
  }
}

/// Displays a hex color string and a button to copy it to the clipboard.
class _HexColorDisplayWidget extends StatelessWidget {
  const _HexColorDisplayWidget({
    required this.color,
    required this.isBright,
  });

  /// The background color whose hexadecimal value is being displayed.
  final Color color;

  /// Indicates whether the background color behind this widget has a high
  /// luminance.
  ///
  /// If true, applies dark text/icons for visibility on light backgrounds.
  final bool isBright;

  @override
  Widget build(BuildContext context) {
    const Color lightTextColor = AppColors.plainWhite;
    const Color blackTextColor = AppColors.plainBlack;

    // TODO: change to function
    final String colorString =
        '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';

    return Row(
      mainAxisAlignment: .center,
      children: [
        Text(
          colorString,
          style: AppTextStyle.montserratRegular.copyWith(
            fontSize: 20,
            color: isBright ? blackTextColor : lightTextColor,
          ),
        ),
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
