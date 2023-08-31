import 'package:ecosan/app/models/voucher/voucher.dart';
import 'package:ecosan/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class VoucherkuController extends GetxController {
  final index = 0.obs;
  ProfileController profileController = ProfileController.i;
  late Rx<List<Voucher>> vouchers;
  @override
  void onInit() async {
    super.onInit();
    vouchers = profileController.vouchers;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<Voucher>> getVouchers() async {
    final result = await profileController.voucherRepository.get();
    return result;
  }
}
