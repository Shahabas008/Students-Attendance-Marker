import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/controller/attendancecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Attendancelistteacher extends StatefulWidget {
  const Attendancelistteacher({super.key});

  @override
  State<Attendancelistteacher> createState() => AattendancelistteacherState();
}

class AattendancelistteacherState extends State<Attendancelistteacher> {
  final controller = Get.put(Attendancecontroller());
  final selectedDate = Get.arguments["selectedDate"];
  final date = Get.arguments["Date"];

  @override
  void initState() {
    super.initState();
    controller.date = selectedDate;
    controller.fetchAttendance();
  }

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
            child: StreamBuilder<DocumentSnapshot<Map<String,dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('Teacher')
                  .doc(controller.subname)
                  .collection("Attendance")
                  .doc(date)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot<Map<String,dynamic>>> snapshot) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                     Map<String,dynamic> data = snapshot.data!.data() as Map<String,dynamic> ;
                    return Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            data['student Name'],
                            style: const TextStyle(fontSize: 18),
                          ),
                          Radio(
                            value: "absent",
                            groupValue:
                                controller.attendance[data['student Name']],
                            onChanged: (value) {
                              controller.attendance[data['student Name']] = value;
                            },
                          ),
                          Radio(
                            value: "present",
                            groupValue:
                                controller.attendance[data['student Name']],
                            onChanged: (value) {
                              controller.attendance[data['student Name']] = value;
                            },
                          ),
                          Radio(
                            value: "late",
                            groupValue:
                                controller.attendance[data['student Name']],
                            onChanged: (value) {
                              controller.attendance[data['student Name']] = value;
                            },
                          ),
                        ],
                      );
                    });
                  },
                  // itemCount:
                      // snapshot.data == null ? 0 : data,
                );
              },
            ),
          ),
          
        ]),
      ),
    ));
  }
}
