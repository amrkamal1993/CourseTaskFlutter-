import 'package:courseapp/src/bloc/course_cubit.dart';
import 'package:courseapp/src/data/repositories/course_repository.dart';
import 'package:courseapp/src/view/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/di_container/di_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DIContainer(GetIt.instance).allReadyAsync();

  // Trying to loading App User Entity Values

  runApp(
    const CourseappLauncher(),
  );
}

class CourseappLauncher extends StatelessWidget {
  const CourseappLauncher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (_) => CourseCubit(GetIt.instance.get<CourseRepository>()),
          child: const SafeArea(
              minimum: EdgeInsets.all(5), child: Scaffold(body: CoursePage())),
        ));
  }
}
