import 'package:collegeproject/Students/attendanceliststudent.dart';
import 'package:collegeproject/controller/attendance_students_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceStudents extends StatefulWidget {
  const AttendanceStudents({super.key});

  @override
  State<AttendanceStudents> createState() => _AttendanceStudentsState();
}

class _AttendanceStudentsState extends State<AttendanceStudents> {
  final controller = Get.put(AttendanceStudentsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Attendance Date"),
        ),
        body: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: controller.attendanceSnapshot.value == null
                ? []
                : controller.attendanceSnapshot.value!.docs
                    .map((element) => MaterialButton(
                          child: Text(element.id),
                          onPressed: () {
                            Get.to(() => const Attendanceliststudent(),
                                arguments: {"attendanceSnapshot": element});
                          },
                        ))
                    .toList(),
          );
        }),
      ),
    );
  }
}
