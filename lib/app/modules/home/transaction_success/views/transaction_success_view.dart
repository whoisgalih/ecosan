import 'package:ecosan/app/constants/utils.dart';
import 'package:ecosan/app/models/user/transaction_model.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/transaction_success_controller.dart';

class TransactionSuccessView extends GetView<TransactionSuccessController> {
  const TransactionSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Transaction transaction = Get.arguments['transaction'];
    String getDescription() {
      if (transaction.orderType == 'Pemasangan Alat') {
        return 'Pemasangan alat akan dilakukan dengan estimasi 1 - 2 hari setelah pembayaran berhasil';
      } else {
        return 'Pembersihan akan dilakukan dengan estimasi 1 - 2 hari setelah pembayaran berhasil';
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Transaksi Berhasil'),
        centerTitle: true,
        backgroundColor: EcoSanColors.primary,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.h),
                border: Border.all(
                  color: Colors.black.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Status Pesanan',
                        style: TextStyles.small.semibold(),
                      ),
                      Text(
                        transaction.status,
                        style: TextStyles.small,
                      )
                    ],
                  ),
                  spacer(),
                  Text(getDescription()),
                  separator(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Alamat',
                        style: TextStyles.small.semibold(),
                      ),
                      Text(
                        'Lihat Titik Lokasi',
                        style: TextStyles.tiny2,
                      )
                    ],
                  ),
                  spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: EcoSanColors.primary.shade400,
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      Expanded(
                        child: Text(
                          '${transaction.name}\n${transaction.phone}\n${transaction.address}',
                          style: TextStyles.small,
                        ),
                      )
                    ],
                  ),
                  separator(),
                  Text(
                    'Rincian Pesanan',
                    style: TextStyles.small.semibold(),
                  ),
                  spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '1 x ${transaction.orderType}',
                        style: TextStyles.small,
                      ),
                      Text(
                        Utils.rupiahFormatter(transaction.price),
                        style: TextStyles.small,
                      )
                    ],
                  ),
                  spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '1 x Biaya ${transaction.orderType.split(' ').first}',
                        style: TextStyles.small,
                      ),
                      Text(
                        'Gratis',
                        style: TextStyles.small,
                      )
                    ],
                  ),
                  spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total',
                        style: TextStyles.small.semibold(),
                      ),
                      Text(
                        'Rp 500.000',
                        style: TextStyles.small.semibold(),
                      )
                    ],
                  ),
                  separator(),
                  Text(
                    'Metode Pembayaran',
                    style: TextStyles.small.semibold(),
                  ),
                  spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        transaction.paymentMethod,
                        style: TextStyles.small,
                      ),
                      Text(
                        'Lunas',
                        style: TextStyles.small,
                      )
                    ],
                  ),
                  separator(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Kode Transaksi',
                        style: TextStyles.small.semibold(),
                      ),
                      Text(
                        transaction.transactionCode,
                        style: TextStyles.small.semibold(),
                      )
                    ],
                  ),
                  spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Waktu Order',
                        style: TextStyles.small,
                      ),
                      Text(
                        Utils.dateFormatter(transaction.orderDate),
                        style: TextStyles.small,
                      )
                    ],
                  ),
                  spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Waktu Pembayaran',
                        style: TextStyles.small,
                      ),
                      Text(
                        Utils.dateFormatter(transaction.paymentDate),
                        style: TextStyles.small,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            EcoSanButton(
                onTap: () => Get.back(),
                child: Text(
                  'Kembali',
                  style: TextStyles.normal.bold(color: Colors.white),
                )),
            SizedBox(
              height: 4.5.h,
            )
          ],
        ),
      ),
    );
  }

  Container separator() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 0.75.h),
      color: Colors.black.withOpacity(0.1),
      height: 1,
    );
  }

  SizedBox spacer() {
    return SizedBox(
      height: 0.75.h,
    );
  }
}
