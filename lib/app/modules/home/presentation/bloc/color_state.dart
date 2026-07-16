part of 'color_cubit.dart';

/// Represents the immutable state of the color configuration.
///
/// Holds the background color, the appropriate high-contrast text color,
/// and a flag indicating if the background is considered bright.
class ColorState extends Equatable {
  /// The current background color.
  final Color backgroundColor;

  /// The contrasting text color optimized for readability against
  /// [backgroundColor].
  final Color textColor;

  /// Whether the [backgroundColor] is considered bright (high luminance).
  final bool isBright;

  @override
  List<Object?> get props => [
    backgroundColor,
    textColor,
    isBright,
  ];

  const ColorState._({
    required this.backgroundColor,
    required this.textColor,
    required this.isBright,
  });

  /// The initial state
  ///
  /// Defaults to a plain white background, black text, and [isBright] set to
  /// `true`.
  const ColorState.initial()
    : backgroundColor = AppColors.plainWhite,
      textColor = AppColors.plainBlack,
      isBright = true;

  /// Creates a copy of the current state with optionally updated fields.
  ColorState copyWith({
    Color? backgroundColor,
    Color? textColor,
    bool? isBright,
  }) {
    return ColorState._(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      isBright: isBright ?? this.isBright,
    );
  }
}
