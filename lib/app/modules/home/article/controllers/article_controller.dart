import 'package:ecosan/app/models/article/article_model.dart';
import 'package:ecosan/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController {
  final ArticleModel article = Get.arguments;
  final HomeController homeController = HomeController.i;
  List<ArticleModel> list = [];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    random();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void random() {
    list =
        List.from(homeController.articles.value); // Create a copy of the list

    // Remove the current article from the list
    list.remove(article);

    // Shuffle the list
    list.shuffle();
  }

  void increment() => count.value++;
}
