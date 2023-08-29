import 'package:ecosan/app/models/trashHistory/trash_history_model.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/icon_container.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistorySanitasiSampahItem extends StatelessWidget {
  final TrashHistory trashHistory;

  const HistorySanitasiSampahItem({super.key, required this.trashHistory});

  void navigateToPage() {
    if (trashHistory.isPickup()) {
      if (trashHistory.status == TrashHistoryStatus.onTheWay) {
        Get.toNamed(Routes.PICKUP_HISTORY, arguments: trashHistory.id);
      }

      if (trashHistory.status == TrashHistoryStatus.waitingToClaim) {
        Get.toNamed(Routes.CLAIM, arguments: trashHistory.id);
      }

      if (trashHistory.status == TrashHistoryStatus.completed) {
        Get.toNamed(Routes.PICKUP_HISTORY, arguments: trashHistory.id);
      }

      if (trashHistory.status == TrashHistoryStatus.order) {
        Get.toNamed(Routes.KONFIRMASI_KURIR, arguments: trashHistory.id);
      }
    }

    if (!trashHistory.isPickup()) {
      if (trashHistory.status == TrashHistoryStatus.onTheWay) {
        Get.toNamed(Routes.VERIFICATION, arguments: trashHistory.id);
      }

      if (trashHistory.status == TrashHistoryStatus.waitingToClaim) {
        Get.toNamed(Routes.VERIFICATION_SUCCESS, arguments: trashHistory.id);
      }

      if (trashHistory.status == TrashHistoryStatus.completed) {
        Get.snackbar(
            "Sampah telah diambil", "Terima kasih telah berpartisipasi");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 15,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Material(
        color: Colors.white,
        child: InkResponse(
          onTap: () {
            navigateToPage();
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconContainer(
                      icon: trashHistory.isPickup()
                          ? Icons.delivery_dining
                          : Icons.pin_drop_rounded,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trashHistory.trashBankName,
                            style: TextStyles.small.bold(),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            trashHistory.id ?? "",
                            style: TextStyles.tiny.copyWith(
                              color: EcoSanColors.systemGray[2],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _histotyData("Dari:", trashHistory.name),
                    SizedBox(
                      width: 12,
                    ),
                    _histotyData(
                      "Status:",
                      trashHistory.isPickup() ? "Pickup Point" : "Drop Point",
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _histotyData("Menuju:", trashHistory.trashBankName),
                    SizedBox(
                      width: 12,
                    ),
                    _histotyData("Berat:", "${trashHistory.weight} kg"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _histotyData(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.tiny.copyWith(
              color: EcoSanColors.systemGray[2],
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyles.small.bold(),
          )
        ],
      ),
    );
  }
}
