// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropPoint _$DropPointFromJson(Map<String, dynamic> json) => DropPoint(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      open: json['open'] as String,
      close: json['close'] as String,
      isOrganic: json['isOrganic'] as bool,
      isAnorganic: json['isAnorganic'] as bool,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$DropPointToJson(DropPoint instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'open': instance.open,
      'close': instance.close,
      'isOrganic': instance.isOrganic,
      'isAnorganic': instance.isAnorganic,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
