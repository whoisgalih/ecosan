import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class IllustrationLayout extends StatelessWidget {
  final String title;
  final String description;
  final String svgPath;
  final Widget button;

  const IllustrationLayout({
    super.key,
    required this.title,
    required this.description,
    required this.svgPath,
    required this.button,
  });

  const IllustrationLayout.noButton({
    super.key,
    required this.title,
    required this.description,
    required this.svgPath,
  }) : button = const SizedBox();

  IllustrationLayout.buttonText({
    super.key,
    required this.title,
    required this.description,
    required this.svgPath,
    required String buttonText,
    required VoidCallback onTap,
  }) : button = EcoSanButton(
          onTap: onTap,
          child: Text(
            buttonText,
            style: TextStyles.normal.bold(color: Colors.white),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
              child: Column(
                children: [
                  SvgPicture.asset(svgPath, width: 80.w),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    title,
                    style: TextStyles.header2.bold(color: EcoSanColors.primary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    description,
                    style: TextStyles.normal,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        button == const SizedBox()
            ? const SizedBox()
            : Container(
                margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: MediaQuery.of(context).padding.bottom + 16),
                child: button,
              ),
      ],
    );
  }
}
