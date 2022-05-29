import 'package:courseapp/src/data/dtos/course_data_response.dart';
import 'package:dio/dio.dart';

import '../../../core/dio_client/dio_client.dart';

class CourseDataProvider {
  final IDioClient dioClient;
  CourseDataProvider({required this.dioClient});

  Future<CourseDataResponse> getCourseDataAsync() async {
    Response<dynamic> response = await dioClient
        .getClient()
        .get("https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34");
    return CourseDataResponse.fromJson(response.data);

    //(data) => CourseDataResponse.fromJson(data as Map<String, dynamic>
  }
}
