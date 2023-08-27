import 'dart:async';

import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KodeBayarController extends GetxController {
  final count = 0.obs;
  final countdown = (24 * 60 * 60).obs; // 24 hours in seconds
  late Timer _timer;
void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (countdown.value > 0) {
        countdown.value--;
      }
    });
  }

  final List<Widget> langkahPembayaran = [
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
            text: 'Pilih ',
            style: TextStyles.small.copyWith(color: EcoSanColors.systemBlack),
            children: [
              TextSpan(text: '\“BRIVA\”', style: TextStyles.small.bold()),
              TextSpan(
                  text: ' pada halaman BRImo.',
                  style: TextStyles.small
                      .copyWith(color: EcoSanColors.systemBlack)),
            ])),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
            text: 'Masukkan Nomor Kode Bayar ',
            style: TextStyles.small.copyWith(color: EcoSanColors.systemBlack),
            children: [
              TextSpan(text: '6317315486136', style: TextStyles.small.bold()),
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
  @override
  void onInit() {
    super.onInit();
    _startCountdown();
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
