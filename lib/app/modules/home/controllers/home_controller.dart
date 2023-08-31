import 'package:ecosan/app/constants/firebase_constants.dart';
import 'package:ecosan/app/models/article/article_model.dart';
import 'package:ecosan/app/models/user/user_model.dart';
import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthController authController = AuthController.authInstance;
  static HomeController i = Get.find();
  Rx<List<ArticleModel>> articles = Rx<List<ArticleModel>>([]);
  Rx<User> get user => authController.user;

  void setUser(User user) {
    authController.user.value = user;
  }

  void fetchArticles() async {
    firestore.collection('artikel').get().then(
      (value) {
        articles.value = value.docs.map((e) {
          return ArticleModel.fromJson(e.data());
        }).toList();
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  void signOut() {
    authController.signOut();
  }
}
