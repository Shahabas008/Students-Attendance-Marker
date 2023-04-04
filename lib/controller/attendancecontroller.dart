import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Attendancecontroller extends GetxController {
  RxMap attendance = {}.obs;
  RxList dates = [].obs;
  String subname = '';
  String date = '';

  void addDate(date) {
    dates.add(date);
  }

  void setAttendanceList(List<QueryDocumentSnapshot> list) {
    for (int i = 0; i < list.length; i++) {
      attendance.addAll({
        list[i].get('student Name'): {
          "absent": false,
          "present": false,
          "late": false
        }
      });
    }
    attendance.refresh();
  }

  Future submitattendance() async {
    //stroing the attendance recorder to the current user
    await FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("Subject")
        .doc(subname)
        .collection("Attendance")
        .doc(date)
        .set({"attendance": attendance});
        //uploading to the teacher collection
        await FirebaseFirestore.instance
        .collection("Teacher")
        .doc(subname)
        .collection("Attendance")
        .doc(date)
        .set({"attendance": attendance});
        Get.back();
  }
  
}
