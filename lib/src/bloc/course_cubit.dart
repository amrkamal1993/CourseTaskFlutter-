import 'package:bloc/bloc.dart';
import 'package:courseapp/src/data/repositories/course_repository.dart';
import 'package:meta/meta.dart';

import '../data/dtos/course_data_response.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepository _repo;

  CourseCubit(this._repo) : super(CourseInitial());

  Future<void> getCourseDataAsync() async {
    try {
      final response = await _repo.getCourseDataAsync();
      if (response != null) {
        emit(CourseLoaded(response));
      } else {
        emit(CourseError(response));
      }
    } catch (_) {
      return;
    }
  }
}
