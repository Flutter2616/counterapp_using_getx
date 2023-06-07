import 'package:counterapp_using_getx/ToDo_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Todocontroller extends GetxController {
  RxList<String> prioritylist=<String>["High","Normal","Low"].obs;
  RxString priority='High'.obs;
  RxList<Todomodel> todolist = <Todomodel>[
    Todomodel(
        title: "jf",
        date: "12/2/3",
        note: "dhfsfgbfdjghsdhfgdshhhgfsdfghsdghsufudfduehfghdsghdfgsdhgshdgsdhgugruggergeruyegdfghsdgfdfhd",
        prayority: "High",
        time: "12:00"),
    Todomodel(
        title: "fjghjf",
        date: "12/2/3",
        note: "dhfsdjfhjbgefdfhd",
        prayority: "Normal",
        time: "12:00"),
    Todomodel(
        title: "fjghjf",
        date: "12/2/3",
        note: "dhfdfjdgjdhd",
        prayority: "Low",
        time: "12:00"),
    Todomodel(
        title: "fjghjf",
        date: "12/2/3",
        note: "dhfdfhgdhgfdfhd",
        prayority: "Normal",
        time: "12:00"),
  ].obs;
  DateTime nowdate=DateTime.now();
  RxString pickdate="${DateTime.now()}".obs;
  TimeOfDay nowtime=TimeOfDay.now();
  RxString picktime="12:00".obs;

  String date_Format(DateTime date)
  {
    var d=DateFormat("dd-MM-yyyy");
    return d.format(date);
  }

  String Time_Format(DateTime date)
  {
    var t=DateFormat("dd-MM-yyyy");
    return t.format(date);
  }
}
