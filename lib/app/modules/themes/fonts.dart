import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final TextStyle tiny2 = GoogleFonts.plusJakartaSans(
    fontSize: 9,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle tiny = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle small = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    height: 1.57,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle normal = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle header3 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    height: 1.56,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle header2 = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle header1 = GoogleFonts.plusJakartaSans(
    fontSize: 24,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );
}

extension WeightModifier on TextStyle {
  TextStyle semibold({Color color = EcoSanColors.systemBlack}) {
    return copyWith(fontWeight: FontWeight.w600, color: color);
  }

  TextStyle bold({Color color = EcoSanColors.systemBlack}) {
    return copyWith(fontWeight: FontWeight.w700, color: color);
  }
}
