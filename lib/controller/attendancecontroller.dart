import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/controller/createclassdetails.controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class Countercontroller extends GetxController {
  final data = Get.put(Createclassdetailscontroller());
  final databaseReference = FirebaseDatabase.instance.ref();
  final studentname = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void addstudents(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 153, 153, 153)),
                  onPressed: () {
                    attendancerecoder();
                  },
                  child: const Text('Done'))
            ],
            elevation: 15,
            title: const Text(
              'Add student',
              style: TextStyle(color: Color.fromARGB(255, 153, 153, 153)),
            ),
            content: Form(
              key: formkey,
              child: TextFormField(
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
      });
      navigator!.pop();
    }
  }

  //pop calendar used in the attendance page
}

//new class for the creation of the folder
// class AppUtil extends GetxController {
//   static Future<String> createFolderInAppDocDir(String selectedDate) async {
//     //Get this App Document Directory
//        Directory appDocDir = await getApplicationDocumentsDirectory();
//     //App Document Directory + folder name
//     final Directory appDocDirFolder =
//         Directory('${appDocDir.path}/$selectedDate/');

//     if (await appDocDirFolder.exists()) {
//       //if folder already exists return path
//       return appDocDirFolder.path;
//     } else {
//       //if folder not exists create folder and then return its path
//       final Directory appDocDirNewFolder =
//           await appDocDirFolder.create(recursive: true);
//       return appDocDirNewFolder.path;
//     }
//   }
// }
