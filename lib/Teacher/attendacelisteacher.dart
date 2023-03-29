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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Attendance Recorder')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          controller.setAttendanceList(snapshot.data!.docs.length);
          return ListView.builder(
            itemBuilder: (context, index) {
          DocumentSnapshot x = snapshot.data!.docs[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(x['student Name']),
              Checkbox(  
  value: controller.attendance[index]["absent"],
  onChanged: (bool? value) {  
    controller.attendance[index]["absent"] = value;
  },  
),
//               Checkbox(  
//   value: index <= controller.attendance.length ? controller.attendance[index]["present"] : 0,   
//   onChanged: (bool? value) {  
//     controller.attendance[index]["present"] = value;
//   },  
// ),
//               Checkbox(  
//   value: index <= controller.attendance.length ? controller.attendance[index]["late"] : 0,   
//   onChanged: (bool? value) {  
//     controller.attendance[index]["late"] = value;
//   },  
// ),
            ],
          );
            },
            itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
          );
        },
      ),
    ));
  }
}
