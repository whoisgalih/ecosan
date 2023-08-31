import 'package:ecosan/app/models/article/article_model.dart';
import 'package:ecosan/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class ArticleListController extends GetxController {
  List<ArticleModel> list = HomeController.i.articles.value;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
