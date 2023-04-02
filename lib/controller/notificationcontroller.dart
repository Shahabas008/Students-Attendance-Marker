import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Notificationcontroller extends GetxController{
  final notification= TextEditingController();
  final formkey = GlobalKey<FormState>();
  // void addstudents(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           actions: [
  //            ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: const Color.fromARGB(255, 153, 153, 153)
  //             ),
  //             onPressed: () {
  //              notificationregister();
               
  //            }, child: const Text('Done'))
  //           ],
  //           elevation: 15,
  //           title: const Text('Notification',
  //           style: TextStyle(
  //             color: Color.fromARGB(255, 153, 153, 153)
  //           ),),
  //           content: Form(
  //             key: formkey,
  //             child: TextFormField(
  //               controller: notification,
  //               validator: ((value) {
  //                 if (value!.isEmpty) {
  //                   return 'The field is required';
  //                 } else {
  //                   return null;
  //                 }
  //               }),
    
  //               decoration: const InputDecoration(
  //                 prefixIcon: Icon(Icons.person),
  //                 border: OutlineInputBorder(),
  //                 labelText: 'Enter Message',
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }

}  
  
  
  