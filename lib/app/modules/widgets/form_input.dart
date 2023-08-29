import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final bool? readOnly;
  final double bottomMargin;

  const FormInput({
    super.key,
    required this.label,
    required this.hint,
    this.readOnly,
    this.icon,
    required this.keyboardType,
    required this.controller,
    this.onTap,
    this.validator,
    this.bottomMargin = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.tiny.bold(),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: controller,
            validator: validator,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            obscureText: keyboardType == TextInputType.visiblePassword,
            style: TextStyles.tiny,
            decoration: InputDecoration(
              prefixIcon: icon == null
                  ? null
                  : Icon(
                      icon,
                      size: 24,
                    ),
              hintText: hint,
            ),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
