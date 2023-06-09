import 'package:counterapp_using_getx/ToDo_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Todocontroller extends GetxController {
  RxList<String> prioritylist = <String>["High", "Normal", "Low"].obs;
  RxString priority = 'High'.obs;
  RxList<Todomodel> todolist = <Todomodel>[
    Todomodel(
        title: "jf",
        date: "12/2/3",
        note:
            "dhfsfgbfdjghsdhfgdshhhgfsdfghsdghsufudfduehfghdsghdfgsdhgshdgsdhgugruggergeruyegdfghsdgfdfhd",
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
  List<Todomodel> searchlist = [];
  List<Todomodel> filterlist = [];
  DateTime nowdate = DateTime.now();
  RxString pickdate = "${DateTime.now()}".obs;



  String date_Format(DateTime date) {
    var d = DateFormat("dd-MM-yyyy");
    return d.format(date);
  }

  TimeOfDay nowtime = TimeOfDay.now();
  RxString picktime = "${TimeOfDay.now()}".obs;
  String setTime(TimeOfDay t)
  {
    return "${t.hour.toString().padLeft(2,'0')} : ${t.minute.toString().padLeft(2,'0')}";
  }


  void searchbar(String value) {
    if(value.isEmpty)
      {
        filterlist=todolist;
      }
    else
      {
        searchlist.clear();
        for(var t in todolist)
          {
            if(t.title!.toLowerCase().contains(value.toLowerCase()))
              {
                searchlist.add(t);
              }
          }
        filterlist=searchlist;
      }
    update();
  }
}
