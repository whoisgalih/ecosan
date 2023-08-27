class Transaction {
  String status;
  int price;
  String orderDate;
  String paymentDate;
  String paymentMethod;
  String orderType;
  String name;
  String address;
  String phone;

  Transaction({
    required this.status,
    required this.price,
    required this.orderDate,
    required this.paymentDate,
    required this.paymentMethod,
    required this.orderType,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      status: json['status'],
      price: json['price'],
      orderDate: json['order_date'],
      paymentDate: json['payment_date'],
      paymentMethod: json['payment_method'],
      name: json['name'],
      address: json['address'],
      orderType: json['order_type'],
      phone: json['number'],
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'price': price,
        'order_date': orderDate,
        'payment_date': paymentDate,
        'payment_method': paymentMethod,
        'name': name,
        'address': address,
        'order_type': orderType,
        'number': phone,
      };
}
