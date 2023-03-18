import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Notificationcontroller extends GetxController{

  final notification= TextEditingController();
  final formkey = GlobalKey<FormState>();
  void addstudents(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 153, 153, 153)
              ),
              onPressed: () {
               notificationregister();
               
             }, child: const Text('Done'))
            ],
            elevation: 15,
            title: const Text('Notification',
            style: TextStyle(
              color: Color.fromARGB(255, 153, 153, 153)
            ),),
            content: Form(
              key: formkey,
              child: TextFormField(
                controller: notification,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return 'The field is required';
                  } else {
                    return null;
                  }
                }),
    
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Enter Message',
                ),
              ),
            ),
          );
        });
  }
  //uploading the notification download url to the firestore database 
  void notificationregister() async{
     var now = DateTime.now();
    var month = now.month.toString().padLeft(2, '0');
    var day = now.day.toString().padLeft(2, '0');
    var time = '${now.hour}:${now.minute}  ${now.year}-$month-$day ';
    final currentuser = FirebaseAuth.instance.currentUser!.email;
    if(formkey.currentState!.validate()){
          await FirebaseFirestore.instance.collection('Notification').doc().set({
    "Notification" : notification.text,
    "Time" : time
   });
         await FirebaseFirestore.instance.collection('User-Notification').doc(currentuser).collection('My-notification').add({
    "Notification" : notification.text,
    "Time" : time
   });
    }
    navigator!.pop();
   
  }
}  
  
  
  