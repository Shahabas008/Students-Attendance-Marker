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

  //creating sign up account for the studetns and teachers and validation
  void createuser(String email, String password) async {
    try{
      await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch (e){
      if(e.code == "email-already-in-use"){
    
       Get.showSnackbar(const GetSnackBar(
        margin: EdgeInsets.all(15),
        borderRadius: 8,
        message:
            ('There already exists an account with the given email address.'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
     }
    }
    
  }

  //Registering of students details to firestore
  Future registeruserstudents(String email, String firstname, String lastname) async {
    
      if (formkey.currentState!.validate()) {
        await FirebaseFirestore.instance.collection('Students').doc(email).set({
          "First Name": firstname,
          "Last Name": lastname,
          "E-Mail": email,
        });
    }
  }


  //Registering of Teacher details to firestore
  Future registeruserteacher(String email, String firstname, String lastname) async {
    
      if (formkey.currentState!.validate()) {
        await FirebaseFirestore.instance.collection('Teacher').doc(email).set({
          "First Name": firstname,
          "Last Name": lastname,
          "E-Mail": email,
        });
  }
}
}