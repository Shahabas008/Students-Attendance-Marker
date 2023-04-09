import 'package:collegeproject/controller/attendance_list_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Attendanceliststudent extends StatefulWidget {
  const Attendanceliststudent({super.key});

  @override
  State<Attendanceliststudent> createState() => AattendanceliststudentState();
}

class AattendanceliststudentState extends State<Attendanceliststudent> {
  final controller = Get.put(AttendanceListStudentController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Attendance Recorder"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                'Absent',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                'Late',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                'Present',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Divider(
            height: 45,
            color: Colors.black,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: controller.attendanceSnapshot.get("attendance").length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    controller.attendanceSnapshot
                        .get("attendance")
                        .entries
                        .elementAt(index)
                        .key,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: "absent",
                    groupValue: controller.attendanceSnapshot
                        .get("attendance")
                        .entries
                        .elementAt(index)
                        .value,
                    onChanged: (value) {
                      return;
                    },
                  ),
                  Radio(
                    value: "present",
                    groupValue: controller.attendanceSnapshot
                        .get("attendance")
                        .entries
                        .elementAt(index)
                        .value,
                    onChanged: (value) {
                      return;
                    },
                  ),
                  Radio(
                    value: "late",
                    groupValue: controller.attendanceSnapshot
                        .get("attendance")
                        .entries
                        .elementAt(index)
                        .value,
                    onChanged: (value) {
                      return;
                    },
                  ),
                ],
              );
            },
            // itemCount:
            // snapshot.data == null ? 0 : data,
          )),
        ]),
      ),
    ));
  }
}
