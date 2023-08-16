// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      phone: json['phone'] as String,
      city: json['city'] as String,
      birthdate: json['birthdate'] as String,
    );

const _$UserFieldMap = <String, String>{
  'name': 'name',
  'phone': 'phone',
  'city': 'city',
  'birthdate': 'birthdate',
};

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'city': instance.city,
      'birthdate': instance.birthdate,
    };
