import 'package:courseapp/src/data/dtos/reserve_types_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_data_response.g.dart';

@JsonSerializable()
class CourseDataResponse {
  final int? id;
  String? title;
  List<String>? img;
  String? interest;
  final int? price;
  String? date;
  String? address;
  String? trainerName;
  String? trainerImg;
  String? trainerInfo;
  String? occasionDetail;
  String? latitude;
  String? longitude;
  final bool? isLiked;
  final bool? isSold;
  final bool? isPrivateEvent;
  final bool? hiddenCashPayment;
  final int? specialForm;
  String? questionnaire;
  String? questExplanation;
  List<ReserveTypes>? reservTypes;

  CourseDataResponse(
      {this.id,
      this.title,
      this.img,
      this.interest,
      this.price,
      this.date,
      this.address,
      this.trainerName,
      this.trainerImg,
      this.trainerInfo,
      this.occasionDetail,
      this.latitude,
      this.longitude,
      this.isLiked,
      this.isSold,
      this.isPrivateEvent,
      this.hiddenCashPayment,
      this.specialForm,
      this.questionnaire,
      this.questExplanation,
      this.reservTypes});

  factory CourseDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseDataResponseToJson(this);
}
