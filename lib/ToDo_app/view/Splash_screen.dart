import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.offAllNamed('/home');
      },
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/logo.png",
                height: 50.w,
                width: 50.w,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  children: [
                    styletext("D", Colors.blue),
                    styletext("a", Colors.red),
                    styletext("i", Colors.amber),
                    styletext("l", Colors.blue),
                    styletext("y", Colors.green),
                    styletext(" ", Colors.green),
                    styletext("N", Colors.blue),
                    styletext("o", Colors.red),
                    styletext("t", Colors.amber),
                    styletext("e", Colors.blue),
                    styletext("s", Colors.green),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan styletext(String ch, Color c) {
    return TextSpan(
      text: "$ch",
      style: GoogleFonts.spaceMono(
          color: c, fontWeight: FontWeight.w700, fontSize: 20.sp),
    );
  }
}
