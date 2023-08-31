import 'package:ecosan/app/models/article/article_model.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/bottom_bar.dart';
import 'package:ecosan/app/modules/widgets/button_text.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
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
                      Obx(
                        () => Text(
                          "Hi, ${controller.user.value.name.split(" ").first}!",
                          style: TextStyles.header2.semibold(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          sanAction(
                            color: EcoSanColors.primary,
                            title: "Ayo lihat status air mu!",
                            image: "assets/images/water.png",
                            onTap: () => Get.offNamed(Routes.AIR),
                          ),
                          const SizedBox(width: 16),
                          sanAction(
                            color: EcoSanColors.secondary,
                            title: "Sudah buang sampah hari ini?",
                            image: "assets/images/trash.png",
                            onTap: () => Get.offNamed(Routes.SAMPAH),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            sectionTitle(
                title: "Yuk baca artikel!",
                onTap: () => Get.toNamed(Routes.ARTICLE_LIST)),
            SizedBox(
              height: 160,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return artikelCard(controller.articles.value[index]);
                  },
                  itemCount: controller.articles.value.length,
                ),
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

  InkWell artikelCard(ArticleModel article) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.ARTICLE, arguments: article),
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 8),
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
            Image.network(
              article.image,
              height: 75,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    article.title,
                    style: TextStyles.tiny,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${article.like} disukai",
                        style: TextStyles.tiny2,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "${article.comment} komentar",
                        style: TextStyles.tiny2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
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

class ProfileListTile extends StatelessWidget {
  const ProfileListTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.ontap});
  final Widget leading;
  final String title;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        height: 40 / 800 * 100.h,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(1.h),
                  decoration: BoxDecoration(
                    color: EcoSanColors.primary.shade600,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: leading,
                ),
                SizedBox(
                  width: 2.h,
                ),
                Text(
                  title,
                  style: TextStyles.small.bold().copyWith(color: Colors.black),
                )
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.leadingWidget,
      required this.title,
      required this.color,
      required this.value,
      required this.buttonStr,
      required this.onTap});
  final Widget leadingWidget;
  final String title;
  final int value;
  final String buttonStr;
  final Function() onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112 / 800 * 100.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 1.25.h, horizontal: 2.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leadingWidget,
          SizedBox(
            width: 1.5.h,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.small.copyWith(color: Colors.white),
                    ),
                    Text(value.toString(),
                        style: TextStyles.header2
                            .bold()
                            .copyWith(color: Colors.white)),
                  ],
                ),
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 1.h),
                        minimumSize: const Size(double.infinity, 0),
                      ),
                      onPressed: onTap,
                      child: Text(
                        buttonStr,
                        style: TextStyles.tiny.bold(color: color),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
