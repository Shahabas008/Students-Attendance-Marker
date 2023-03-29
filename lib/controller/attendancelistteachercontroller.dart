import 'package:get/get.dart';

class AttendanceListTeacherController extends GetxController {
  RxList<Map> attendance = [{"absent": false, "present": false, "late": false}].obs;

  void setAttendanceList(int listLength) {
    attendance.removeLast();
    attendance.value = List<Map>.generate(listLength, (i) =>{"absent": false, "present": false, "late": false} );
  }
}