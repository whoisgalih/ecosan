import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final TextInputType keyboardType;

  const FormInput({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.tiny.bold(),
        ),
        const SizedBox(height: 4),
        TextField(
            keyboardType: keyboardType,
            style: TextStyles.tiny,
            decoration: InputDecoration(
                prefixIcon: icon == null
                    ? null
                    : Icon(
                        icon,
                        size: 24,
                      ),
                hintText: hint)),
      ],
    );
  }
}
