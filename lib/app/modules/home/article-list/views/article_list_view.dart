import 'package:ecosan/app/models/article/article_model.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/article_list_controller.dart';

class ArticleListView extends GetView<ArticleListController> {
  const ArticleListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kumpulan Artikel'),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 3.h, left: 2.h, right: 2.h),
          child: Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return articleListTile(controller.list[index]);
              },
              itemCount: controller.list.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 1.h,
              ),
            ),
          )),
    );
  }

  GestureDetector articleListTile(ArticleModel article) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.ARTICLE, arguments: article),
      child: SizedBox(
        height: 65 / 800 * 100.h,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 90 / 360 * 100.w,
              height: 65 / 800 * 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(article.image), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 1.h,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    article.title,
                    maxLines: 2,
                    style: TextStyles.small.bold(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  article.getDate(),
                  style: TextStyles.small,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
