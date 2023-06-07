import 'package:get/get.dart';

class Countercontroller extends GetxController {
  int i = 0;

  void increment() {
    i++;
    update();
  }

  void decrement() {
    i--;
    update();
  }

  void twox() {
    i = i * 2;
    update();
  }

  void threex() {
    i = i * 3;
    update();
  }

  void fourx() {
    i = i * 4;
    update();
  }
}
