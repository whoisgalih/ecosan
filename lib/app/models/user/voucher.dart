class Voucher {
  Voucher({
    required this.title,
    required this.price,
    this.purchasedDate,
    this.usedDate,
  });
  final String title;
  final int price;
  String? purchasedDate;
  String? usedDate;
  Voucher.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        price = json['price'],
        usedDate = json['usedDate'],
        purchasedDate = json['purchasedDate'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
        'usedDate': usedDate,
        'purchasedDate': purchasedDate,
      };

  bool get isUsed => usedDate != null;
}
