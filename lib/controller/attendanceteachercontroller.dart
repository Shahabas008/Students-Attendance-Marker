import 'package:get/get.dart';

class AttendanceTeacherController extends GetxController {
  RxList dates = [].obs;

  void addDate(date) {
    dates.add(date);
  }
}