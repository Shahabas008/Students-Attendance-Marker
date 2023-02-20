import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';





class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();


  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();


  //Call this Function from Design & it will do the rest
  void registerUser(String email, String password) async{
   
    String? error = FirebaseAuth.instance.createUserWithEmailAndPassword(  email: email , password: password) as String?;
    if(error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }


}