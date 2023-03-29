import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AttendanceListTeacherController extends GetxController {
  RxMap attendance = {}.obs;

  void setAttendanceList(List<QueryDocumentSnapshot> list) {
    for (int i=0;i<list.length;i++) {
      attendance.addAll({list[i].get('student Name'): {"absent": false, "present": false, "late": false}});
    }
    attendance.refresh();
  }

  Future submit() async {
    await FirebaseFirestore.instance.collection("attendance_list").add({"attendance": attendance});
  }
}