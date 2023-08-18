import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
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
      required this.birthdate});
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
  final String name;
  final String phone;
  final String city;
  final String birthdate;
  Map<String, Object?> toJson() => _$UserToJson(this);
}
