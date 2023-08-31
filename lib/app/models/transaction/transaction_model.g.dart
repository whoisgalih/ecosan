// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String,
      status: json['status'] as String,
      price: json['price'] as int,
      orderDate: json['orderDate'] as String,
      paymentDate: json['paymentDate'] as String,
      paymentMethod: json['paymentMethod'] as String,
      orderType: json['orderType'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      transactionCode: json['transactionCode'] as String,
    );

const _$TransactionFieldMap = <String, String>{
  'id': 'id',
  'status': 'status',
  'price': 'price',
  'orderDate': 'orderDate',
  'paymentDate': 'paymentDate',
  'paymentMethod': 'paymentMethod',
  'orderType': 'orderType',
  'name': 'name',
  'address': 'address',
  'phone': 'phone',
  'transactionCode': 'transactionCode',
};

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'status': instance.status,
      'price': instance.price,
      'orderDate': instance.orderDate,
      'paymentDate': instance.paymentDate,
      'paymentMethod': instance.paymentMethod,
      'orderType': instance.orderType,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'transactionCode': instance.transactionCode,
    };
