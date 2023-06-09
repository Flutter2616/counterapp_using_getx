import 'package:counterapp_using_getx/ToDo_app/controller/todo_controller.dart';
import 'package:counterapp_using_getx/ToDo_app/model/todo_model.dart';
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
  TextEditingController txttitle = TextEditingController();
  TextEditingController txtnote = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int index = Get.arguments;
    return SafeArea(
      child: Obx(
        () => Scaffold(
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
                    Obx(
                      () => Text("${todo.todolist[index].title}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              color: Colors.black)),
                    ),
                    Spacer(),
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Obx(
                          () => Text(
                            "${todo.todolist[index].prayority}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                                color: Colors.black),
                          ),
                        )),
                    SizedBox(width: 10),
                    InkWell(onTap: () {
                      txttitle=TextEditingController(text: "${todo.todolist[index].title}");
                      txtnote=TextEditingController(text: "${todo.todolist[index].note}");
                      todo.priority.value=todo.todolist[index].prayority!;
                      todo.pickdate.value=todo.todolist[index].date!;
                      todo.picktime.value=todo.todolist[index].time!;
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
                                              todo.setTime(picktime!);
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
                                          Todomodel updatetask = Todomodel(
                                              time: todo.picktime.value,
                                              date: todo.pickdate.value,
                                              prayority: todo.priority.value,
                                              note: txtnote.text,
                                              title: txttitle.text);
                                          todo.todolist[index]=updatetask;
                                          Get.back();
                                        },
                                        child: Container(
                                          width: 35.w,
                                          height: 6.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                          color: Colors.green.shade300
                                          ),
                                          child: Text("Update Task",
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
                    },child: Icon(Icons.edit, color: Colors.black, size: 18.sp)),
                  ],
                ),
                SizedBox(height: 10),
                Obx(
                  () => Text("Date:${todo.todolist[index].date}",style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.black),),
                ),
                SizedBox(height: 20),
                Obx(
                  () => Text(
                    "${todo.todolist[index].note}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
