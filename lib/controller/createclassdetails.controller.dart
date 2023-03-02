import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Teacher/classlistviewteacher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Createclassdetailscontroller extends GetxController{
  static Createclassdetailscontroller get instance => Get.find();


///Textformfield variable declaration
final teachername = TextEditingController();
final classname = TextEditingController();
final subjectname = TextEditingController();
final formkey = GlobalKey<FormState>();



void registerclass(String teachername, String classname , String subjectname) async{
  if(formkey.currentState!.validate()) {
    await FirebaseFirestore.instance.collection('Class').doc(teachername).set({
      "Teacher Name" : teachername,
      "Class Name" : classname,
      "Subject Name" : subjectname,
      
    });
    Get.to(() => const Classlistviewteacher());
  }
}
}