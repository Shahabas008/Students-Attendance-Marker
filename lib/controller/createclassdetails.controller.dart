import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/home/appbar_bottomnavteacher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Createclassdetailscontroller extends GetxController {
  ///Textformfield variable declaration
  final teachername = TextEditingController();
  final classname = TextEditingController();
  final subjectname = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final currentuser = FirebaseAuth.instance.currentUser!.email;
  late String teachernames = teachername.text;
  late String subname = subjectname.text;

 //uploading the details of the class for students
  void registerclass(
      String teachername, String classname, String subjectname) async {
    if (formkey.currentState!.validate()) {
      await FirebaseFirestore.instance
          .collection('Teacher')
          .doc("Classes")
          .collection(subjectname)
          .add({
        "Teacher Name": teachername,
        "Class Name": classname,
        "Subject Name": subjectname,
      });
      //uploadint the class details for teachers
      await FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('Subject')
          .doc(subjectname)
          .set({
        "Teacher Name": teachername,
        "Class Name": classname,
        "Subject Name": subjectname,
      });
      Get.offAll(() => const Homepagelayout());
    }
  }
}
