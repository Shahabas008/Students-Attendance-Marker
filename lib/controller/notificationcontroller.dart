import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Notificationcontroller extends GetxController{
  final notification= TextEditingController();
  final formkey = GlobalKey<FormState>();
  String subname = '';
  void addnotification(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 161, 46, 46)),
                    onPressed: () {
                      navigator!.pop();
                    },
                    child: const Text('Back')),
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 153, 153, 153)
              ),
              onPressed: () {
               notificationregister();
               notification.clear();
               
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
                textCapitalization: TextCapitalization.words,
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
  void notificationregister() async {
    String date = DateFormat("MMM, EEE, yyyy").format(DateTime.now());
    String times = DateFormat("hh:mm a").format(DateTime.now());
    var time = '$times  $date';
    if (formkey.currentState!.validate()) {
      //uploading to the user collection
      await FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection("Subject").doc(subname).collection("Notification")
          .add({"Notification": notification.text, "Time": time});
           //uploading to the teacher collection
           await FirebaseFirestore.instance
          .collection('Teacher')
          .doc('Notification')
          .collection(subname)
          .add({"Notification": notification.text, "Time": time});
      // await FirebaseFirestore.instance
      //     .collection('User-Notification')
      //     .doc(currentuser)
      //     .collection('My-notification')
      //     .add({"Notification": data.notification.text, "Time": time});
    }
    navigator!.pop();
  }

}  
  
  
  