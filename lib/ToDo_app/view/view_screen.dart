import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Createscreen extends StatefulWidget {
  const Createscreen({super.key});

  @override
  State<Createscreen> createState() => _CreatescreenState();
}

class _CreatescreenState extends State<Createscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(

                  width: 100.w,
                  height: 82.h,
                  decoration: BoxDecoration( color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(children: [
                    Text("Today",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                    Icon(Icons.date_range,
                        color: Colors.grey.shade400, size: 15.sp)
                  ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  SizedBox(height: 10),
                  Text("15 jun 2019,Tuesday",
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
