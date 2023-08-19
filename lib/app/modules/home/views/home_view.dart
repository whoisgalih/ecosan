import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/bottom_bar.dart';
import 'package:ecosan/app/modules/widgets/button_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/ecosan-horizontal.png", height: 30),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: const BoxDecoration(
              color: EcoSanColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/home-image.png",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 120),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.10000000149011612),
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, User!",
                        style: TextStyles.header2.semibold(),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          sanAction(
                            color: EcoSanColors.primary,
                            title: "Ayo lihat status air mu!",
                            image: "assets/images/water.png",
                            onTap: () {},
                          ),
                          const SizedBox(width: 16),
                          sanAction(
                            color: EcoSanColors.secondary,
                            title: "Sudah buang sampah hari ini?",
                            image: "assets/images/trash.png",
                            onTap: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            sectionTitle(title: "Yuk baca artikel!", onTap: () {}),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  artikelCard(),
                  const SizedBox(width: 16),
                  artikelCard(),
                  const SizedBox(width: 16),
                  artikelCard(),
                  const SizedBox(width: 16),
                  artikelCard(),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            sectionTitle(title: "Cara penggunaan fitur sanitasi"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: sanButton(
                      title: "Ayo kita mulai!",
                      image: "assets/images/hands.png",
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  sanButton(
                    title: "Sanitasi Air",
                    image: "assets/images/water.png",
                    onTap: () {},
                    width: 90,
                  ),
                  const SizedBox(width: 16),
                  sanButton(
                    title: "Sanitasi Sampah",
                    image: "assets/images/trash.png",
                    onTap: () {},
                    width: 90,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  Container sanButton({
    required String title,
    required String image,
    GestureTapCallback? onTap,
    double? width,
  }) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: width ?? double.infinity,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black.withOpacity(0.10000000149011612),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                image,
                width: 45,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: TextStyles.small,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container artikelCard() {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 175,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black.withOpacity(0.10000000149011612),
        ),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/0ee68eaade524d04e566a137274b3fc3.png",
            height: 75,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  "Ini 8 ciri-ciri air tercemar, Sudah amankah airmu?",
                  style: TextStyles.tiny,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "2 disukai",
                      style: TextStyles.tiny2,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "2 komentar",
                      style: TextStyles.tiny2,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding sectionTitle({
    required String title,
    GestureTapCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: TextStyles.header3.semibold(),
              ),
            ),
          ),
          onTap != null
              ? ButtonText(
                  text: "Lihat semua",
                  onTap: onTap,
                  textStyle: TextStyles.tiny.copyWith(
                    color: EcoSanColors.primary,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Expanded sanAction({
    required String title,
    required String image,
    GestureTapCallback? onTap,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 135,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Material(
          color: color,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      image,
                      width: 51,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyles.small.copyWith(color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
