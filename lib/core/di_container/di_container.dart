import 'package:get_it/get_it.dart';

import '../../src/data/data_provider/course_data_provider.dart';
import '../../src/data/repositories/course_repository.dart';
import '../dio_client/dio_client.dart';

class DIContainer {
  final GetIt instance;

  DIContainer(this.instance) {
    instance.registerSingleton<DioClient>(DioClient());

    instance.registerFactory<CourseRepository>(() => CourseRepository(
        dataProvider:
            CourseDataProvider(dioClient: instance.get<DioClient>())));
  }

  Future<void> allReadyAsync() => instance.allReady();
}
