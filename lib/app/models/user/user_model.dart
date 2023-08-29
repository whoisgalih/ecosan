import 'package:ecosan/app/models/user/transaction_model.dart';
import 'package:ecosan/app/models/user/voucher.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  User(
      {required this.name,
      required this.phone,
      required this.city,
      required this.uid,
      required this.poin,
      this.photoUrl,
      required this.birthdate});
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
  String name;
  String phone;
  String city;
  String birthdate;
  String uid;
  String? photoUrl;
  List<Transaction> transactions = [];
  List<Voucher> vouchers = [];
  int poin;
  Map<String, Object?> toJson() => _$UserToJson(this);

  bool get isNewUser => transactions.isEmpty;
}
