import 'dart:math';
import 'dart:ui';

import 'package:amazing_colors/app/core/styles/app_colors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_state.dart';

// A Cubit that manages the application's background and text color state.
///
/// It handles generating random background colors and automatically calculating
/// the appropriate contrasting text color (light or dark).
class ColorCubit extends Cubit<ColorState> {
  final double _defaultOpacity = 1;
  final double _defaultBrightness = 0.5;
  final Color _lightTextColor = AppColors.plainWhite;
  final Color _blackTextColor = AppColors.plainBlack;

  /// Creates a [ColorCubit]
  ColorCubit() : super(const ColorState.initial());

  /// Generates a new random background color, determines its brightness, 
  /// and emits the new color, brightness status, and contrasting text color.
  void changeBackgroundColor() {
    final newBackgroundColor = _generateRandomColor();
    final isBrigth = _isBackgroundLuminanceLight(newBackgroundColor);

    emit(state.copyWith(
      backgroundColor: newBackgroundColor,
      isBright: isBrigth,
      textColor: isBrigth ? _blackTextColor : _lightTextColor,
    ));

  }

  Color _generateRandomColor() {
    final red = Random().nextInt(256);
    final green = Random().nextInt(256);
    final blue = Random().nextInt(256);

    return Color.fromRGBO(red, green, blue, _defaultOpacity);
  }

  /// Returns a boolean
  ///
  /// Represents the brightness of the background color, if it is dark or light.
  bool _isBackgroundLuminanceLight(Color backgroundColor) {
    return backgroundColor.computeLuminance() > _defaultBrightness;
  }
}
