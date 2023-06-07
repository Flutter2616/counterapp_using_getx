import 'dart:math';

import 'package:counterapp_using_getx/ToDo_app/controller/todo_controller.dart';
import 'package:counterapp_using_getx/ToDo_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController txttitle = TextEditingController();
  TextEditingController txtnote = TextEditingController();

  Todocontroller todo = Get.put(Todocontroller());

  @override
  void initState() {
    todo.pickdate.value = todo.date_Format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isDismissible: false,
                  backgroundColor: Colors.blue.shade200,
                  enableDrag: true,
                  isScrollControlled: true,
                  showDragHandle: true,
                  barrierColor: Colors.transparent,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      width: 100.w,
                      height: 75.h,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          TextField(
                              controller: txttitle,
                              decoration: InputDecoration(
                                  hintText: "Title",
                                  // label: Text("Title",
                                  //     style: TextStyle(
                                  //         color: Colors.black,
                                  //         fontSize: 13.sp)),
                                  prefixIcon: Icon(Icons.edit, size: 15.sp),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15)),
                                  fillColor: Colors.white,
                                  filled: true)),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () async {
                                  DateTime? Pickdate = (await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2030),
                                  ));
                                  todo.pickdate.value =
                                      todo.date_Format(Pickdate!);
                                },
                                child: Obx(
                                  () => Container(
                                    height: 6.h,
                                    width: 45.w,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("${todo.pickdate}"),
                                          SizedBox(width: 10),
                                          Icon(Icons.calendar_month),
                                        ]),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  TimeOfDay? picktime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now());
                                  todo.picktime.value =
                                      todo.Time_Format(picktime as DateTime);
                                },
                                child: Obx(
                                  () => Container(
                                    height: 6.h,
                                    width: 45.w,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("${todo.picktime}"),
                                          SizedBox(width: 10),
                                          Icon(Icons.watch_later),
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                hint: Text("Select priority"),
                                autofocus: false,
                                alignment: Alignment.center,
                                dropdownColor: Colors.white,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                                borderRadius: BorderRadius.circular(20),
                                items: todo.prioritylist
                                    .map((element) => DropdownMenuItem(
                                        child: Text(
                                          "$element",
                                        ),
                                        value: element))
                                    .toList(),
                                value: "${todo.priority}",
                                onChanged: (value) {
                                  todo.priority.value = value! as String;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                              controller: txtnote,
                              maxLines: 10,
                              decoration: InputDecoration(
                                  hintText: "Asign your Task......",
                                  // label: Text("Title",
                                  //     style: TextStyle(
                                  //         color: Colors.black,
                                  //         fontSize: 13.sp)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15)),
                                  fillColor: Colors.white,
                                  filled: true)),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Todomodel t = Todomodel(
                                      time: todo.picktime.value,
                                      date: todo.pickdate.value,
                                      prayority: todo.priority.value,
                                      note: txtnote.text,
                                      title: txttitle.text);
                                  todo.todolist.add(t);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 35.w,
                                  height: 6.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(colors: [
                                        Colors.blue.shade600,
                                        Colors.blue.shade400,
                                        Colors.blue.shade300
                                      ])),
                                  child: Text("Add Task",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                  shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25))));
            },
            child: Icon(Icons.add, color: Colors.white, size: 20.sp)),
        body: Padding(
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
                Icon(Icons.date_range, color: Colors.grey.shade400, size: 15.sp)
              ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
              SizedBox(height: 10),
              Text("${todo.nowdate}",
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp)),
              SizedBox(height: 20),
              Container(
                height: 5.h,
                width: 100.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue)),
                child: TextField(
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                      hintText: "Search your notes",
                      prefixIcon:
                          Icon(Icons.menu, color: Colors.black, size: 4.w),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => Expanded(
                  child: MasonryGridView.builder(
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed('/note',arguments: index);

                        },
                        onLongPress: () {
                          showDialog(barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text("This notes is Delete",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400)),
                                content: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(onPressed: () {
                                      todo.todolist.removeAt(index);
                                      Navigator.pop(context);
                                    }, child: Icon(Icons.done,color: Colors.white,size: 20.sp)),
                                    IconButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, icon: Icon(Icons.close,size: 20.sp,color: Colors.blue))
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: todo.todolist[index].prayority == "High"
                                  ? Colors.red.shade100
                                  : todo.todolist[index].prayority == "Normal"
                                      ? Colors.green.shade100
                                      : Colors.amber.shade100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${todo.todolist[index].title}",
                                      style: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp)),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                      child: Text(
                                          "${todo.todolist[index].prayority}")),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text("${todo.todolist[index].note}"),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${todo.todolist[index].date}"),
                                  Text("${todo.todolist[index].time}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: todo.todolist.length,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
