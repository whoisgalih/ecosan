// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      phone: json['phone'] as String,
      city: json['city'] as String,
      birthDate: json['birthDate'] as String,
    );

const _$UserFieldMap = <String, String>{
  'phone': 'phone',
  'city': 'city',
  'birthDate': 'birthDate',
};

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'phone': instance.phone,
      'city': instance.city,
      'birthDate': instance.birthDate,
    };
