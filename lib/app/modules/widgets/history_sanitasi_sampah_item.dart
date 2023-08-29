import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/icon_container.dart';
import 'package:flutter/material.dart';

class HistorySanitasiSampahItem extends StatelessWidget {
  const HistorySanitasiSampahItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconContainer(icon: Icons.delivery_dining),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Perumahan Indah Permai",
                      style: TextStyles.small.bold(),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "#32324234",
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
              _histotyData("Dari:", "Aditya Saputra"),
              SizedBox(
                width: 12,
              ),
              _histotyData("Status:", "Pickup Poin"),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _histotyData("Menuju:", "Pengepul Indah Permai"),
              SizedBox(
                width: 12,
              ),
              _histotyData("Berat:", "8 kg"),
            ],
          ),
        ],
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
