class Transaction{
  String status;
  int price;
  String orderDate;
  String paymentDate;
  String paymentMethod;
  String name;
  String address;

  Transaction({
    required this.status,
    required this.price,
    required this.orderDate,
    required this.paymentDate,
    required this.paymentMethod,
    required this.name,
    required this.address,
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
  };
}