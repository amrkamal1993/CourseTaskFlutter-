import 'package:json_annotation/json_annotation.dart';

part 'reserve_types_response.g.dart';

@JsonSerializable()
class ReserveTypes {
  final int? id;
  String? name;
  final int? count;
  final int? price;

  ReserveTypes({this.id, this.name, this.count, this.price});

  factory ReserveTypes.fromJson(Map<String, dynamic> json) =>
      _$ReserveTypesFromJson(json);
  Map<String, dynamic> toJson() => _$ReserveTypesToJson(this);
}
