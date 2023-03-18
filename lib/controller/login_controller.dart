import 'package:collegeproject/create_an_account/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();

  /// Authentication of the user(whether the user is signed in or not) and validation
  final _auth = FirebaseAuth.instance;
  

  Future signIn(String email, String password) async {
    try{
      if(formkey.currentState!.validate()){
      await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    }
    }
    on FirebaseAuthException catch(e){
      switch (e.code) {
        case "invalid-email":
          return Get.showSnackbar(
            const  GetSnackBar(
              margin: EdgeInsets.all(15),
              borderRadius: 8,
              message:
                  ('Your username or password is incorrect. Please try again.'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ),
          ); 

        case "wrong-password":
          return Get.showSnackbar(
            const GetSnackBar(
              margin: EdgeInsets.all(15),
              borderRadius: 8,
              message: ('The password is invalid for the given email'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
               
            ),
            
          );
 
        case "user-not-found":
        
          return Get.showSnackbar(
            const GetSnackBar(
              margin: EdgeInsets.all(15),
              borderRadius: 8,
              message: ('There is no user corresponding to the given email.'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ),
          );
      }
    }
    
    
  }

  /// TextField Validation

  ///sign out code
  Future signOut() async {
    await _auth.signOut();
    Get.offAll(() => const Loginpage());

  }
}
