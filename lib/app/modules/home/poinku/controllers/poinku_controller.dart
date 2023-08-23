import 'package:ecosan/app/models/user/voucher.dart';
import 'package:get/get.dart';

class PoinkuController extends GetxController {
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
}
