import '../../../core/data_transfer_object/value_commit_result.dart';
import '../data_provider/course_data_provider.dart';
import '../dtos/course_data_response.dart';

class CourseRepository {
  final CourseDataProvider dataProvider;
  CourseRepository({required this.dataProvider});

  Future<CourseDataResponse> getCourseDataAsync() =>
      dataProvider.getCourseDataAsync();
}
