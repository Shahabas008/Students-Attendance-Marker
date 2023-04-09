import 'package:collegeproject/controller/addstudentscontroller.dart';
import 'package:collegeproject/controller/attendancecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceStudents extends StatefulWidget {
  const AttendanceStudents({super.key});

  @override
  State<AttendanceStudents> createState() => _AttendanceStudentsState();
}

class _AttendanceStudentsState extends State<AttendanceStudents> {
  final data = Get.put(Countercontroller());
  final controller = Get.put(Attendancecontroller());
  final subname = Get.arguments["subname"];
  @override
  void initState() {
    
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Attendance Date"),
        ),
        //evde attendanceliststudentsilott navigate cheyumbo Date ne argument akki kodukuka.
      ),
    );
  }
}
