// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve_types_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReserveTypes _$ReserveTypesFromJson(Map<String, dynamic> json) => ReserveTypes(
      id: json['id'] as int?,
      name: json['name'] as String?,
      count: json['count'] as int?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$ReserveTypesToJson(ReserveTypes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'price': instance.price,
    };
