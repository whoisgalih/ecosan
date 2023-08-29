// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashHistory _$TrashHistoryFromJson(Map<String, dynamic> json) => TrashHistory(
      id: json['id'] as String?,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      trashType: json['trashType'] as String,
      weight: (json['weight'] as num).toDouble(),
      time: json['time'] as String,
      note: json['note'] as String,
      status: $enumDecode(_$TrashHistoryStatusEnumMap, json['status']),
      type: $enumDecode(_$TrashHistoryTypeEnumMap, json['type']),
      trashBankName: json['trashBankName'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

const _$TrashHistoryFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'phone': 'phone',
  'address': 'address',
  'trashType': 'trashType',
  'weight': 'weight',
  'time': 'time',
  'note': 'note',
  'status': 'status',
  'type': 'type',
  'trashBankName': 'trashBankName',
  'latitude': 'latitude',
  'longitude': 'longitude',
};

Map<String, dynamic> _$TrashHistoryToJson(TrashHistory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'trashType': instance.trashType,
      'weight': instance.weight,
      'time': instance.time,
      'note': instance.note,
      'status': _$TrashHistoryStatusEnumMap[instance.status]!,
      'type': _$TrashHistoryTypeEnumMap[instance.type]!,
      'trashBankName': instance.trashBankName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

const _$TrashHistoryStatusEnumMap = {
  TrashHistoryStatus.order: 'order',
  TrashHistoryStatus.onTheWay: 'onTheWay',
  TrashHistoryStatus.waitingToClaim: 'waitingToClaim',
  TrashHistoryStatus.completed: 'completed',
  TrashHistoryStatus.canceled: 'canceled',
};

const _$TrashHistoryTypeEnumMap = {
  TrashHistoryType.pickup: 'pickup',
  TrashHistoryType.dropoff: 'dropoff',
};
