import 'package:equatable/equatable.dart';

class Voucher extends Equatable {
  Voucher(
      {required this.title,
      required this.price,
      this.purchasedDate,
      this.usedDate,
      this.id});
  @override
  List<Object?> get props => [title, price, purchasedDate, usedDate];
  final String title;
  final int price;
  String? purchasedDate;
  String? usedDate;
  String? id;
  Voucher.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        price = json['price'],
        usedDate = json['usedDate'],
        id = json['id'],
        purchasedDate = json['purchasedDate'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
        'usedDate': usedDate,
        'purchasedDate': purchasedDate,
        'id': id ?? '',
      };

  bool get isUsed => usedDate != null;
}
