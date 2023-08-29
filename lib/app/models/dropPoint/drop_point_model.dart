import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:ecosan/app/constants/firebase_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drop_point_model.g.dart';

@JsonSerializable()
class DropPoint {
  @Id()
  final String id;

  final String name;
  final String address;
  final String phone;

  final String open;
  final String close;

  final bool isOrganic;
  final bool isAnorganic;

  final double latitude;
  final double longitude;

  DropPoint({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.open,
    required this.close,
    required this.isOrganic,
    required this.isAnorganic,
    required this.latitude,
    required this.longitude,
  });

  factory DropPoint.fromJson(Map<String, dynamic> json) =>
      _$DropPointFromJson(json);

  Map<String, dynamic> toJson() => _$DropPointToJson(this);
}

CollectionReference get dropPointCollection =>
    firestore.collection('dropPoint');
