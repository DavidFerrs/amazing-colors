import 'package:amazing_colors/app/core/extensions/color_converter_extension.dart';
import 'package:amazing_colors/app/core/styles/app_colors.dart';
import 'package:amazing_colors/app/core/styles/app_text_style.dart';
import 'package:amazing_colors/app/modules/home/presentation/bloc/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The application main screen
///
/// Displays a tap-to-change random background color. It automatically adjusts
/// the system UI overlay (status bar) and text colors to maintain contrast and
/// readability.
class HomePage extends StatelessWidget {
  /// Creates a [HomePage].
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorCubit = context.read<ColorCubit>();

    return BlocBuilder<ColorCubit, ColorState>(
      bloc: colorCubit,
      builder: (_, state) {
        /// Does not have an [AppBar] used [AnnotatedRegion] for the screen to
        /// change the status Bar brightness
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: state.isBright
              ? SystemUiOverlayStyle.dark
              : SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: colorCubit.changeBackgroundColor,
            child: Scaffold(
              body: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: state.backgroundColor,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        'Hello there!',
                        style: AppTextStyle.carterOneRegular.copyWith(
                          color: state.textColor,
                        ),
                      ),
                      _HexStringWidget(
                        color: state.backgroundColor,
                        isBright: state.isBright,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Displays a hex color string and a button to copy it to the clipboard.
class _HexStringWidget extends StatelessWidget {
  const _HexStringWidget({
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

    final String colorString = color.toHexString;

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
