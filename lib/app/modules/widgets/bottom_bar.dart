import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 10,
              offset: Offset(0, -4),
              spreadRadius: 5,
            )
          ],
        ),
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 20 + MediaQuery.of(context).padding.bottom,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomBarItem(
                  icon: Icons.home,
                  label: "Home",
                  pageName: "/home",
                ),
                bottomBarItem(
                  icon: Icons.water_drop,
                  label: "Air",
                  pageName: "/air",
                ),
                bottomBarItem(
                  icon: Icons.recycling,
                  label: "Sampah",
                  pageName: "/sampah",
                ),
                bottomBarItem(
                  icon: Icons.person,
                  label: "Profile",
                  pageName: "/profile",
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Expanded bottomBarItem({icon, label, pageName}) {
    bool isActive = Get.currentRoute == pageName;

    return Expanded(
      child: InkResponse(
        onTap: () {
          Get.offNamed(pageName);
        },
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color:
                  isActive ? EcoSanColors.primary : EcoSanColors.primary[100],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: TextStyles.tiny.copyWith(
                fontWeight: FontWeight.bold,
                color:
                    isActive ? EcoSanColors.primary : EcoSanColors.primary[100],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
