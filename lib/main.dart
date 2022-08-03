import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/views/home/main_food_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 683),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Food app',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MainFooodPage(),
          )),
    );
  }
}
