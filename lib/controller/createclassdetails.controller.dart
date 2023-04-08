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
  String subname = "" ;
  String teacher = '';
  String classes = '';
    //uploading the details of the class for students
  void registerclass(
      String teachername, String classname, String subjectname) async {
    if (formkey.currentState!.validate()) {
      await FirebaseFirestore.instance
          .collection('Teacher')
          .doc("Classes")
          .collection("Classes")
          .doc(subjectname)
          .set({
        "Teacher Name": teachername,
        "Class Name": classname,
        "Subject Name": subjectname,
      });
      //uploading the class details for teachers
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
  
//adding the students class to my class page on account page
  void addtomyclasses() async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('My-classes')
        .doc(subname)
        .set({
      "Teacher Name": teacher,
      "Class Name": classes,
      "Subject Name":subname,
    });
    Get.showSnackbar(const GetSnackBar(
      borderRadius: 8,
      padding: EdgeInsets.all(20),
      messageText: Text(
        'Added to My classes',
        style: TextStyle(
          color: Color.fromARGB(255, 161, 46, 46),
        ),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.white,
    ));
  }
}
