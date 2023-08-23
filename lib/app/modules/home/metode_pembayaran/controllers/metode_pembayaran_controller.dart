import 'package:get/get.dart';

class MetodePembayaranController extends GetxController {
  final List<MetodePembayaran> paymentMethod = [
    MetodePembayaran(
        imagePath: 'assets/images/payment/mandiri.png', title: 'Mandiri VA'),
    MetodePembayaran(
        imagePath: 'assets/images/payment/bca.png', title: 'BCA VA'),
    MetodePembayaran(
        imagePath: 'assets/images/payment/bni.png', title: 'BNI VA'),
    MetodePembayaran(
        imagePath: 'assets/images/payment/bri.png', title: 'BRI VA'),
    MetodePembayaran(
        imagePath: 'assets/images/payment/link.png', title: 'LinkAja'),
    MetodePembayaran(
        imagePath: 'assets/images/payment/gopay.png', title: 'GoPay'),
    MetodePembayaran(
        imagePath: 'assets/images/payment/dana.png', title: 'DANA'),
  ];
  final selectedPaymentIdx = Rxn<int>();
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

class MetodePembayaran {
  MetodePembayaran({
    required this.imagePath,
    required this.title,
  });
  final String imagePath;
  final String title;
}
