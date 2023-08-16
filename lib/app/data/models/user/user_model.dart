import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:ecosan/app/data/models/firestore_serializeable.dart';

part 'user_model.g.dart';

@firestoreSerializable
class User {
  User({
    required this.phone,
    required this.city,
    required this.birthDate,
  });

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  final String phone;
  final String city;
  final String birthDate;

  Map<String, Object?> toJson() => _$UserToJson(this);
}

// @Collection<User>('users')
// final usersRef = UserCollectionReference();
