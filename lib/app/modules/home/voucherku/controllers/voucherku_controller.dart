import 'package:ecosan/app/models/user/voucher.dart';
import 'package:get/get.dart';

class VoucherkuController extends GetxController {
  //TODO: Implement VoucherkuController
  final index = 0.obs;
  final List<Voucher> vouchers = [
    Voucher(price: 100, title: 'Pizza Hut'),
    Voucher(price: 100, title: 'Gulaku')
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
