import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosan/app/constants/firebase_constants.dart';
import 'package:ecosan/app/models/user/transaction_model.dart'
    as transaction_model;

import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KodeBayarController extends GetxController {
  final countdown = (24 * 60 * 60).obs; // 24 hours in seconds
  late Timer _timer;
  late String kodeBayar;
  String paymentTitle = Get.arguments['payment_method'].title;
  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (countdown.value > 0) {
        countdown.value--;
      }
    });
  }

  int generateRandomNumber(int length) {
    Random random = Random();

    // Generate first 9 digits
    int minFirst = 100000000;
    int maxFirst = 999999999;
    int firstDigits = minFirst + random.nextInt(maxFirst - minFirst + 1);

    // Generate last 3 digits
    int minLast = 0;
    int maxLast = 999;
    int lastDigits = minLast + random.nextInt(maxLast - minLast + 1);

    // Combine the digits to get a 12-digit number
    int result = int.parse('$firstDigits$lastDigits');

    return result;
  }

  Future<void> pay() async {
    transaction_model.Transaction transaction = transaction_model.Transaction(
        status: 'Sedang diproses',
        transactionCode: kodeBayar,
        price: Get.arguments['price'],
        orderDate: Get.arguments['order_date'],
        paymentDate: DateTime.now().toString(),
        paymentMethod: paymentTitle,
        orderType: Get.arguments['order_type'],
        name: Get.arguments['name'],
        address: Get.arguments['address'],
        phone: Get.arguments['phone']);
    try {
      print('sending to databases');
      final result = await firestore
          .collection('users')
          .doc(AuthController.authInstance.firebaseUser.value!.uid)
          .collection('transactions')
          .add(transaction.toJson());
      print(result.id);
      Get.offAndToNamed('/home/transaction-success', arguments: {
        'transaction': transaction,
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  late List<Widget> langkahPembayaran;
  @override
  void onInit() {
    super.onInit();
    _startCountdown();
    kodeBayar = generateRandomNumber(12).toString();
    langkahPembayaran = [
      RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
              text: 'Pilih ',
              style: TextStyles.small.copyWith(color: EcoSanColors.systemBlack),
              children: [
                TextSpan(text: paymentTitle, style: TextStyles.small.bold()),
                TextSpan(
                    text: ' pada halaman $paymentTitle.',
                    style: TextStyles.small
                        .copyWith(color: EcoSanColors.systemBlack)),
              ])),
      RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
              text: 'Masukkan Nomor Kode Bayar ',
              style: TextStyles.small.copyWith(color: EcoSanColors.systemBlack),
              children: [
                TextSpan(text: kodeBayar, style: TextStyles.small.bold()),
                TextSpan(
                    text: ' , kemudian pilih ',
                    style: TextStyles.small
                        .copyWith(color: EcoSanColors.systemBlack)),
                TextSpan(text: 'Lanjutkan.', style: TextStyles.small.bold()),
              ])),
      RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
              text:
                  'Periksa detail pembayaran, Pastikan Nama adalah nama Anda, Keterangan adalah Pembayaran Aplikasi dan Jumlah Tagihan benar. Jika Benar pilih ',
              style: TextStyles.small.copyWith(color: EcoSanColors.systemBlack),
              children: [
                TextSpan(text: 'Ya.', style: TextStyles.small.bold()),
              ])),
      Text(
        'Bukti Pembayaran akan tercetak setelah transaksi berhasil.',
        textAlign: TextAlign.justify,
        style: TextStyles.small,
      ),
    ];
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
