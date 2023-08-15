import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:flutter/material.dart';

class EcoSanButton extends StatelessWidget {
  // create disabled state
  final bool isEnabled;

  // enambled color
  final Color? color;

  // disabled color
  final Color? disabledColor;

  // button properties
  final GestureTapCallback onTap;
  final Widget child;
  final double width;
  final double borderRadius;
  final List<BoxShadow>? boxShadows;

  const EcoSanButton({
    super.key,
    this.isEnabled = true,
    this.color,
    this.disabledColor,
    required this.onTap,
    required this.child,
    this.width = double.infinity,
    this.borderRadius = 10,
    this.boxShadows,
  });

  Color get _color => color ?? EcoSanColors.primary[500]!;
  Color get _disabledColor => disabledColor ?? EcoSanColors.primary[100]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: boxShadows),
      child: Material(
        color: isEnabled ? _color : _disabledColor,
        borderRadius: BorderRadius.circular(10),
        child: isEnabled
            ? InkWell(
                onTap: onTap,
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius)),
                child: button(),
              )
            : button(),
      ),
    );
  }

  Container button() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Center(
          child: child,
        ));
  }
}
