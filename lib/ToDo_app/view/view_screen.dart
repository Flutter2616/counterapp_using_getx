import 'package:counterapp_using_getx/ToDo_app/controller/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Createscreen extends StatefulWidget {
  const Createscreen({super.key});

  @override
  State<Createscreen> createState() => _CreatescreenState();
}

class _CreatescreenState extends State<Createscreen> {
  Todocontroller todo = Get.put(Todocontroller());

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: todo.todolist[index].prayority == "High"
            ? Colors.red.shade100
            : todo.todolist[index].prayority == "Normal"
                ? Colors.green.shade100
                : Colors.amber.shade100,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("${todo.todolist[index].title}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: Colors.black)),
                  Spacer(),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Text(
                        "${todo.todolist[index].prayority}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: Colors.black),
                      )),
                  SizedBox(width: 10),
                  Icon(Icons.edit, color: Colors.black, size: 25.sp),
                ],
              ),
              SizedBox(height: 10),
              Text("Date:${todo.todolist[index].date}"),
              SizedBox(height: 20),
              Text(
                "${todo.todolist[index].note}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
