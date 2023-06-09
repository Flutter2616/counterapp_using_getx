import 'package:counterapp_using_getx/ToDo_app/view/Splash_screen.dart';
import 'package:counterapp_using_getx/ToDo_app/view/view_screen.dart';
import 'package:counterapp_using_getx/ToDo_app/view/home_screen.dart';
import 'package:counterapp_using_getx/counter/view/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/home',
        routes: {
          '/': (p0) => Splashscreen(),
          '/home': (p0) => Homescreen(),
          '/note': (p0) => Createscreen(),
        },
        // routes: {
        //   '/':(p0) => Counterscreen(),
        // },
      ),
    ),
  );
}
