
import 'dart:ui';

/// Extension that adds conversion imports to the [Color] class.
extension ColorConverterExtension on Color {

  /// Returns the hexadecimal value of the color formatted as `#RRGGBB` in
  /// uppercase letters.
  String get toHexString {
    final intValue = toARGB32();
    final hexValue = intValue.toRadixString(16); // FF45A924
    // Remove the alpha value [FF]
    final formattedHex = hexValue.padLeft(8, '0').substring(2); // 45A924

    return '#${formattedHex.toUpperCase()}';
  }
}
