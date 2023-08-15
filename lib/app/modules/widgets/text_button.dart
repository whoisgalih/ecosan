import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final double cornerRadius;
  final GestureTapCallback onTap;
  final Color color;
  final TextStyle? textStyle;

  const ButtonText({
    super.key,
    required this.text,
    this.cornerRadius = 4,
    required this.onTap,
    this.color = EcoSanColors.primary,
    this.textStyle,
  });

  TextStyle get _textStyle => textStyle ?? TextStyles.tiny.bold(color: color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius)),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(cornerRadius),
        child: Text(
          text,
          style: _textStyle,
        ),
      ),
    );
  }
}
