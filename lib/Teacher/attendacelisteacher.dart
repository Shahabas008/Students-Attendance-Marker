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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            x['student Name'],
                            style: const TextStyle(fontSize: 18),
                          ),
                          Checkbox(
                            value: controller.attendance[x['student Name']]
                                ["absent"],
                            onChanged: (bool? value) {
                              controller.attendance[x['student Name']]
                                  ["absent"] = value;
                              controller.attendance.refresh();
                            },
                          ),
                          Checkbox(
                            value: index <= controller.attendance.length
                                ? controller.attendance[x['student Name']]
                                    ["present"]
                                : 0,
                            onChanged: (bool? value) {
                              controller.attendance[x['student Name']]
                                  ["present"] = value;
                              controller.attendance.refresh();
                            },
                          ),
                          Checkbox(
                            value: index <= controller.attendance.length
                                ? controller.attendance[x['student Name']]
                                    ["late"]
                                : 0,
                            onChanged: (bool? value) {
                              controller.attendance[x['student Name']]["late"] =
                                  value;
                              controller.attendance.refresh();
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
