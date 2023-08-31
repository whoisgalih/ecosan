// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Voucher _$VoucherFromJson(Map<String, dynamic> json) => Voucher(
      title: json['title'] as String,
      price: json['price'] as int,
      purchasedDate: json['purchasedDate'] as String?,
      usedDate: json['usedDate'] as String?,
    );

const _$VoucherFieldMap = <String, String>{
  'title': 'title',
  'price': 'price',
  'purchasedDate': 'purchasedDate',
  'usedDate': 'usedDate',
};

Map<String, dynamic> _$VoucherToJson(Voucher instance) => <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'purchasedDate': instance.purchasedDate,
      'usedDate': instance.usedDate,
    };
