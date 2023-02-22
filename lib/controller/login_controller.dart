import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class LoginController extends GetxController {
  static LoginController get instance => Get.find();


  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();


  /// TextField Validation

  //Call this Function from Design & it will do the rest
  Future<void> loginUser(String email, String password) async {
    if(formkey.currentState!.validate()){
      await FirebaseAuth.instance.signInWithEmailAndPassword(email :email , password : password) ;
      print('logged in successfully');
    }
    
    


  }
}