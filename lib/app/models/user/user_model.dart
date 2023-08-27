import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:ecosan/app/models/user/transaction_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  // The following values could alternatively be set inside your `build.yaml`
  explicitToJson: true,
  createFieldMap: true,
);

@firestoreSerializable
class User {
  User(
      {required this.name,
      required this.phone,
      required this.city,
      required this.uid,
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
  Map<String, Object?> toJson() => _$UserToJson(this);

  bool get isNewUser => transactions.isEmpty;
}
