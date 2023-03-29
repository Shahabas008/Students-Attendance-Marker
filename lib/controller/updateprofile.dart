import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class Updateprofile extends GetxController{

  void updateemail(){
    final currentuser = FirebaseAuth.instance.currentUser!.email;
    final docRef = FirebaseFirestore.instance.collection(currentuser!).get();
    
  }

}