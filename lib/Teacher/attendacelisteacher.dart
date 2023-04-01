import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/controller/attendancelistteachercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Attendancelistteacher extends StatefulWidget {
  const Attendancelistteacher({super.key});

  @override
  State<Attendancelistteacher> createState() => AattendancelistteacherState();
}

class AattendancelistteacherState extends State<Attendancelistteacher> {
  final controller = Get.put(AttendanceListTeacherController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children:[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Attendance Recorder')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      controller.setAttendanceList(snapshot.data!.docs);
                    }
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        DocumentSnapshot x = snapshot.data!.docs[index];
                        return Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(x['student Name']),
                              Checkbox(
                                value: controller.attendance[x['student Name']]["absent"],
                                onChanged: (bool? value) {
                                  controller.attendance[x['student Name']]["absent"] = value;
                                  controller.attendance.refresh();
                                },
                              ),
                              Checkbox(
                                value: index <= controller.attendance.length
                                    ? controller.attendance[x['student Name']]["present"]
                                    : 0,
                                onChanged: (bool? value) {
                                  controller.attendance[x['student Name']]["present"] = value;
                                  controller.attendance.refresh();
                                },
                              ),
                              Checkbox(
                                value: index <= controller.attendance.length
                                    ? controller.attendance[x['student Name']]["late"]
                                    : 0,
                                onChanged: (bool? value) {
                                  controller.attendance[x['student Name']]["late"] = value;
                                  controller.attendance.refresh();
                                },
                              ),
                            ],
                          );
                        });
                      },
                      itemCount: snapshot.data == null ? 0 : snapshot.data!.docs
                          .length,
                    );
                  },
                ),
              ),
        SizedBox(
          child: ElevatedButton(

            onPressed: () {
controller.submit();
            },
            child: const Text("Submit"),
          ),
        )
            ]
          ),
        )
);
  }
}
