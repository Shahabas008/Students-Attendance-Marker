import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/controller/attendancecontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('User')
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .collection("Subject")
                  .doc(controller.subname)
                  .collection("Student-List")
                  .orderBy("Roll Number" , descending: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    DocumentSnapshot x = snapshot.data!.docs[index];
                    return Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            x['student Name'],
                            style: const TextStyle(fontSize: 18),
                          ),
                          Radio(
                            value: "absent",
                            groupValue:
                                controller.attendance[x['student Name']],
                            onChanged: (value) {
                              controller.attendance[x['student Name']] = value;
                            },
                          ),
                          Radio(
                            value: "present",
                            groupValue:
                                controller.attendance[x['student Name']],
                            onChanged: (value) {
                              controller.attendance[x['student Name']] = value;
                            },
                          ),
                          Radio(
                            value: "late",
                            groupValue:
                                controller.attendance[x['student Name']],
                            onChanged: (value) {
                              controller.attendance[x['student Name']] = value;
                            },
                          ),
                        ],
                      );
                    });
                  },
                  itemCount:
                      snapshot.data == null ? 0 : snapshot.data!.docs.length,
                );
              },
            ),
          ),
          SizedBox(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(350, 50)),
              onPressed: () {
                controller.submitattendance();
              },
              child: const Text("Submit"),
            ),
          )
        ]),
      ),
    ));
  }
}
