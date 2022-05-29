part of 'course_cubit.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseError extends CourseState {
  final CourseDataResponse response;
  CourseError(this.response);
}

class CourseLoaded extends CourseState {
  final CourseDataResponse response;
  CourseLoaded(this.response);
}
