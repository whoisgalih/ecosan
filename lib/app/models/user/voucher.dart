class Voucher {
  Voucher({
    required this.title,
    required this.price,
    this.purchasedDate,
  });
  final String title;
  final int price;
  String? purchasedDate;

  Voucher.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        price = json['price'],
        purchasedDate = json['purchasedDate'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
        'purchasedDate': purchasedDate,
      };
}
