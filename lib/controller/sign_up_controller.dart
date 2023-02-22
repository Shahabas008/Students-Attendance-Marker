import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final phoneNo = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool obscureText = true;

  //creating sign up account for the studetns and teachers
  void createuser(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future registeruser(String email, String firstname, String lastname) async {
    await FirebaseFirestore.instance.collection('Students').doc(email).set({
      "First Name": firstname,
      "Last Name": lastname,
      "E-Mail": email,
    });
    print('successfull');
  }
}
