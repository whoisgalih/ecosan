class Voucher {
  final String title;
  final int price;

  Voucher(this.title, this.price);

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(json['title'], json['price']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
      };
}
