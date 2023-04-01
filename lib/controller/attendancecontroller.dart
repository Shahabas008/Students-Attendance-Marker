import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/controller/createclassdetails.controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class Countercontroller extends GetxController {
  final data = Get.put(Createclassdetailscontroller());
  final databaseReference = FirebaseDatabase.instance.ref();
  final studentname = TextEditingController();
  final rollnumber = TextEditingController();
  late FocusNode myFocusNode;
  @override
  void onInit() {
    super.onInit();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    super.dispose();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void addstudents(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AlertDialog(
              insetPadding:
                  const EdgeInsets.symmetric(vertical: 220, horizontal: 15),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 161, 46, 46)),
                    onPressed: () {
                      navigator!.pop();
                    },
                    child: const Text('Back')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 153, 153, 153)),
                    onPressed: () {
                      attendancerecoder();
                      studentname.clear();
                      rollnumber.clear();
                      myFocusNode.requestFocus();
                    },
                    child: const Text('Done')),
              ],
              elevation: 15,
              title: const Text(
                'Add student',
                style: TextStyle(color: Color.fromARGB(255, 153, 153, 153)),
              ),
              content: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        focusNode: myFocusNode,
                        controller: studentname,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'The field is required';
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Student Name',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: rollnumber,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'The field is required';
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Roll Number',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future attendancerecoder() async {
    if (formkey.currentState!.validate()) {
      await FirebaseFirestore.instance
          .collection('Attendance Recorder')
          .doc(studentname.text)
          .set({
        'student Name': studentname.text,
        "Roll Number": rollnumber.text,
      });
    }
  }
}
