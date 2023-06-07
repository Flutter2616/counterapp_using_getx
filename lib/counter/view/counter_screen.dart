import 'package:counterapp_using_getx/counter/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counterscreen extends StatefulWidget {
  const Counterscreen({super.key});

  @override
  State<Counterscreen> createState() => _CounterscreenState();
}

class _CounterscreenState extends State<Counterscreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Countercontroller>(init: Countercontroller(),builder: (controller) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text("Counter screen",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20)),
              backgroundColor: Colors.black),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${controller.i}",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(backgroundColor: Colors.black,
                      onPressed: () {
                        controller.increment();
                      },
                      child: Text("+1"),
                    ),
                    FloatingActionButton(backgroundColor: Colors.black,
                      onPressed: () {
                        controller.decrement();
                      },
                      child: Text("-1"),
                    ),
                    FloatingActionButton(backgroundColor: Colors.black,
                      onPressed: () {
                        controller.twox();
                      },
                      child: Text("2x"),
                    ),
                    FloatingActionButton(backgroundColor: Colors.black,
                      onPressed: () {
                        controller.threex();
                      },
                      child: Text("3x"),
                    ),
                    FloatingActionButton(backgroundColor: Colors.black,
                      onPressed: () {
                        controller.fourx();
                      },
                      child: Text("4x"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
