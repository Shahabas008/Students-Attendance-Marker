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

  Future<void> fetchAttendanceDates() async {
    QuerySnapshot attendanceSnapshot = await FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("Subject")
        .doc(subname)
        .collection("Attendance")
        .get();

    dates.value = attendanceSnapshot.docs.map((e) => e.id).toList();
    dates.refresh();
  }

  Future<void> fetchAttendance() async {
    try {
      DocumentSnapshot attendanceDoc = await FirebaseFirestore.instance
          .collection("User")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection("Subject")
          .doc(subname)
          .collection("Attendance")
          .doc(date)
          .get();

      attendance.value = attendanceDoc.get("attendance");
      attendance.refresh();
    } catch (e) {
      attendance.value = {};
      attendance.refresh();
    }
  }
}
