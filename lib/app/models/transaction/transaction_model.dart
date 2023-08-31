import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class Transaction {
  @Id()
  String? id;

  String status;
  int price;
  String orderDate;
  String paymentDate;
  String paymentMethod;
  String orderType;
  String name;
  String address;
  String phone;
  String transactionCode;

  Transaction({
    this.id,
    required this.status,
    required this.price,
    required this.orderDate,
    required this.paymentDate,
    required this.paymentMethod,
    required this.orderType,
    required this.name,
    required this.address,
    required this.phone,
    required this.transactionCode,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  // factory Transaction.fromJson(Map<String, dynamic> json) {
  //   return Transaction(
  //     status: json['status'],
  //     price: json['price'],
  //     orderDate: json['order_date'],
  //     paymentDate: json['payment_date'],
  //     paymentMethod: json['payment_method'],
  //     name: json['name'],
  //     address: json['address'],
  //     orderType: json['order_type'],
  //     phone: json['number'],
  //     transactionCode: json['transaction_code'],
  //   );
  // }

  // Map<String, dynamic> toJson() => {
  //       'status': status,
  //       'price': price,
  //       'order_date': orderDate,
  //       'payment_date': paymentDate,
  //       'payment_method': paymentMethod,
  //       'name': name,
  //       'address': address,
  //       'order_type': orderType,
  //       'number': phone,
  //       'transaction_code': transactionCode,
  //     };
}
