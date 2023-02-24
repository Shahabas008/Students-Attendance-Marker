import 'package:get/get.dart';

class Countercontroller extends GetxController{
  var count = 0.obs;
  void increment() {
    count.value++;
  }
  void decrement(){
    count.value--;
  }
}