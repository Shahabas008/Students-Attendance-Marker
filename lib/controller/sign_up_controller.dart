import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/home/appbar_bottomnavteacher.dart';
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



  //creating sign up account for the studetns and teachers and validation
  void createuser(String email, String password, String name )async {
    try {
      UserCredential result =  await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          User? user = result.user;
          user!.updateDisplayName(name);
      Get.offAll(const Homepagelayout());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.showSnackbar(const GetSnackBar(
          borderRadius: 8,
          padding: EdgeInsets.all(20),
          messageText: Text(
            'There already exists an account with the given email address.',
            style: TextStyle(
              color: Color.fromARGB(255, 161, 46, 46),
            ),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
        ));
      }
    }
  }

  //Registering of teacher/students details to firestore
  Future registeruserteacherandstudent(
      String email, String firstname, String lastname, String users) async {
    if (formkey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('User').doc(email).set({
        "First Name": firstname,
        "Last Name": lastname,
        "E-Mail": email,
        "User": users
      });
    }
  }
}