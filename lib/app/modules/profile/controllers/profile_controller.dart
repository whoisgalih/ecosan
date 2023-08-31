import 'package:ecosan/app/models/user/user_model.dart';
import 'package:ecosan/app/models/voucher/voucher.dart';
import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:ecosan/app/repository/voucher_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  AuthController authController = AuthController.authInstance;
  static ProfileController i = Get.find();
  VoucherRepository voucherRepository = VoucherRepository();
  Rx<List<Voucher>> vouchers = Rx<List<Voucher>>([]);
  @override
  void onInit() {
    super.onInit();
    getVouchers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signOut() {
    authController.signOut();
  }

  User get user => authController.user.value;

  Future<void> getVouchers() async {
    final result = await voucherRepository.get();
    vouchers.value = result;
  }
}
