import 'package:ecosan/app/models/user/user_model.dart';
import 'package:ecosan/app/models/voucher/voucher.dart';
import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:ecosan/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class PoinkuController extends GetxController {
  AuthController authController = AuthController.authInstance;
  final profileController = ProfileController.i;
  final List<Voucher> vouchers = [
    Voucher(title: 'Pizza Hut', price: 50),
    Voucher(title: 'Gulaku', price: 50),
    Voucher(title: 'Beras', price: 50),
    Voucher(title: 'Sensor EcoSan', price: 50),
  ];
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

  Rx<User> get user => authController.user;
}
