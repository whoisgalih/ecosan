import 'package:ecosan/app/models/article/article_model.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ArticleModel article = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artikel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              article.image,
              height: 150 / 800 * 100.h,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    article.title,
                    style: TextStyles.header3.bold(color: Colors.black),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    article.source,
                    style: TextStyles.small,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    article.desc,
                    style: TextStyles.small,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rekomendasi Artikel',
                        style: TextStyles.normal.semibold(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () => Get.offNamed(Routes.ARTICLE_LIST),
                        child: Text(
                          'Lihat Semua',
                          style: TextStyles.tiny
                              .copyWith(color: EcoSanColors.primary),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: articleCard(controller.list[0]),
                        flex: 1,
                      ),
                      SizedBox(
                        width: 2.5.h,
                      ),
                      Flexible(
                        child: articleCard(controller.list[1]),
                        flex: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector articleCard(ArticleModel article) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.toNamed(Routes.ARTICLE,
          arguments: article, preventDuplicates: false),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(article.image), fit: BoxFit.cover))),
          SizedBox(
            height: 1.h,
          ),
          Text(
            article.title,
            maxLines: 3,
          )
        ],
      ),
    );
  }
}
