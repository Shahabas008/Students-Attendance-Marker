import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AttendanceListStudentController extends GetxController {
  final attendanceSnapshot =
      Get.arguments["attendanceSnapshot"] as DocumentSnapshot;
}
