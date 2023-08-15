import 'package:flutter/material.dart';

// create color extensions
abstract final class EcoSanColors {
  // primary color
  static const MaterialColor primary = MaterialColor(
    _primaryPrimaryValue,
    <int, Color>{
      50: Color(0xFFD3E6FF),
      100: Color(0xFFA7CAFF),
      200: Color(0xFF7BAFFF),
      300: Color(0xFF4F94FF),
      400: Color(0xFF237AFF),
      500: Color(_primaryPrimaryValue),
      600: Color(0xFF0051CD),
      700: Color(0xFF0041A4),
      800: Color(0xFF00317B),
      900: Color(0xFF002052),
      950: Color(0xFF001029),
    },
  );
  static const int _primaryPrimaryValue = 0xFF0061F6;

  // secondary color
  static const MaterialColor secondary = MaterialColor(
    _secondaryPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF7E2),
      100: Color(0xFFFFEFC5),
      200: Color(0xFFFFE7A7),
      300: Color(0xFFFFDF8A),
      400: Color(0xFFFFD76D),
      500: Color(_secondaryPrimaryValue),
      600: Color(0xFFFFC018),
      700: Color(0xFFFFB000),
      800: Color(0xFFDFA200),
      900: Color(0xFFA87A00),
      950: Color(0xFF705100),
    },
  );
  static const int _secondaryPrimaryValue = 0xFFFFCF50;

  // success color
  static const MaterialColor success = MaterialColor(
    _successPrimaryValue,
    <int, Color>{
      50: Color(0xFFEBFAD6),
      100: Color(0xFFD7F5AD),
      200: Color(0xFFC3F084),
      300: Color(0xFFAFEB5B),
      400: Color(0xFF9BE632),
      500: Color(_successPrimaryValue),
      600: Color(0xFF84D119),
      700: Color(0xFF588B11),
      800: Color(0xFF42680D),
      900: Color(0xFF2C4608),
      950: Color(0xFF162304),
    },
  );
  static const int _successPrimaryValue = 0xFF84D119;

  // error color
  static const MaterialColor error = MaterialColor(
    _errorPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFE4DE),
      100: Color(0xFFFFC9BD),
      200: Color(0xFFFFAE9C),
      300: Color(0xFFFF927A),
      400: Color(0xFFFF7759),
      500: Color(_errorPrimaryValue),
      600: Color(0xFFFF5C38),
      700: Color(0xFFFF3204),
      800: Color(0xFFCF2600),
      900: Color(0xFF9C1C00),
      950: Color(0xFF681300),
    },
  );
  static const int _errorPrimaryValue = 0xFFFF5C38;

  // system black color
  static const MaterialColor systemBlack = MaterialColor(
    _systemBlackPrimaryValue,
    <int, Color>{
      1: Color(_systemBlackPrimaryValue),
      2: Color(0xFF404040),
      3: Color(0xFF606060),
    },
  );
  static const int _systemBlackPrimaryValue = 0xFF202020;

  // system gray color
  static const MaterialColor systemGray = MaterialColor(
    _systemGrayPrimaryValue,
    <int, Color>{
      1: Color(_systemGrayPrimaryValue),
      2: Color(0xFF999999),
      3: Color(0xFFCCCCCC),
    },
  );
  static const int _systemGrayPrimaryValue = 0xFF808080;

  // system white color
  static const MaterialColor systemWhite = MaterialColor(
    _systemWhitePrimaryValue,
    <int, Color>{
      1: Color(_systemWhitePrimaryValue),
    },
  );
  static const int _systemWhitePrimaryValue = 0xFFFFFAFA;
}
