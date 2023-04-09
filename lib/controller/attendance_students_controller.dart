import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AttendanceStudentsController extends GetxController {
  final attendanceSnapshot = Rxn<QuerySnapshot>();

  final subname = Get.arguments["subname"];

  @override
  void onInit() {
    fetchAttendanceDates();

    super.onInit();
  }

  Future<void> fetchAttendanceDates() async {
    attendanceSnapshot.value = await FirebaseFirestore.instance
        .collection("Teacher")
        .doc("Classes")
        .collection("Classes")
        .doc(subname)
        .collection("Attendance")
        .get();
  }
}
