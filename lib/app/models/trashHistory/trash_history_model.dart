import 'package:json_annotation/json_annotation.dart';

part 'trash_history_model.g.dart';

@JsonSerializable()
class TrashHistory {
  final String? id;
  final String name;
  final String phone;
  final String address;

  final String trashType;
  final double weight;
  final String time;
  final String note;

  final String status;
  final String type; // pickup or dropoff

  final String trashBankName;
  final double? latitude;
  final double? longitude;

  TrashHistory({
    this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.trashType,
    required this.weight,
    required this.time,
    required this.note,
    required this.status,
    required this.type,
    required this.trashBankName,
    this.latitude,
    this.longitude,
  });

  factory TrashHistory.fromJson(Map<String, dynamic> json) =>
      _$TrashHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$TrashHistoryToJson(this);
}
