import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  // ---- Montserrat ----
  static TextStyle get montserratLight => const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
  );
  static TextStyle get montserratRegular => const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  static TextStyle get montserratMedium => const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static TextStyle get montserratSemiBold => const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
  static TextStyle get montserratBold => const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  // ---- Carter One -----
  static TextStyle get carterOneRegular => const TextStyle(
    fontFamily: 'CarterOne',
    fontSize: 32,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
}
