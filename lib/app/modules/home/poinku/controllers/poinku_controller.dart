import 'package:ecosan/app/models/user/voucher.dart';
import 'package:get/get.dart';

class PoinkuController extends GetxController {
  final List<Voucher> vouchers = [
    Voucher('Pizza Hut', 50),
    Voucher('Gulaku', 50),
    Voucher('Beras', 50),
    Voucher('Sensor EcoSan', 50)
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
}
