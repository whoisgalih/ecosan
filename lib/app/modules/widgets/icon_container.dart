import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: EcoSanColors.secondary[50],
          borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: EcoSanColors.secondary,
      ),
    );
  }
}
