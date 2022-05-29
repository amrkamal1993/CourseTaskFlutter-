import 'package:carousel_slider/carousel_slider.dart';
import 'package:courseapp/src/data/repositories/course_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../bloc/course_cubit.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    var indicatorController = CarouselController();

    List<String> list = [
      "https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80",
      "https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
      "https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80"
    ];

    return BlocProvider(
        create: (context) => CourseCubit(GetIt.instance.get<CourseRepository>())
          ..getCourseDataAsync(),
        child: BlocConsumer<CourseCubit, CourseState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CourseLoaded) {
                return ListView(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 1.8),
                      carouselController: indicatorController,
                      //list
                      //state.response.img
                      items: list
                          .map((item) => Container(
                                color: Colors.white,
                                child: Center(
                                    child: Image.network(
                                  item.toString(),
                                  fit: BoxFit.fill,
                                )),
                              ))
                          .toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text(state.response.price.toString(),
                                  textAlign: TextAlign.right)),
                          Expanded(
                            flex: 2,
                            child: Text('السعر',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.cairo(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent))),
                            //state.response.price.toString()
                          ),
                        ],
                      ),
                    ),
                    //
                    const Divider(color: Colors.lightBlue),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text(state.response.interest.toString(),
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.cairo(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)))),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'الإهتمامات',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.cairo(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.lightBlue),
                    Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(state.response.occasionDetail.toString(),
                            textAlign: TextAlign.right,
                            style: GoogleFonts.cairo(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)))),
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        height: 44.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.deepPurple, Colors.purple])),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: const Text('قم بالحجز الآن',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is CourseError) {
                return const Scaffold(
                  appBar: null,
                  body: Center(
                      child: Text(
                    'فشل الحصول علي بيانات',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
                );
              } else {
                return const Scaffold(
                    body: Center(
                        child: Text(
                  'جاري التحميل .. من فضلك انتظر',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )));
              }
            }));
  }
}
