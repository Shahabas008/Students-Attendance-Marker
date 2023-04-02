import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeNotificationcontroller extends GetxController{

  final notification= TextEditingController();
  final teachername = TextEditingController();
  final formkey = GlobalKey<FormState>();
  void addnotification(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AlertDialog(
              scrollable: true,
              
              insetPadding: const EdgeInsets.symmetric( vertical: 200,horizontal: 15),
              actions: [ElevatedButton(
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
                 teachername.clear();
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
                child: Column(
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: teachername,
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
                        labelText: 'Enter teacher name',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                          TextFormField(
                      controller: notification,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'The field is required';
                        } else {
                          return null;
                        }
                      }),
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Message',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
  //uploading the notification download url to the firestore database 
  void notificationregister() async{
    String date = DateFormat("MMM, EEE, yyyy").format(DateTime.now());
    String times = DateFormat("hh:mm a").format(DateTime.now());
    var time = '$times  $date';
    if(formkey.currentState!.validate()){
          await FirebaseFirestore.instance.collection('Teacher').doc("Home-Notification").collection('i').add({
    "Notification" : notification.text,
    "Teacher Name" : teachername.text,
    "Time" : time
   });
    }
    navigator!.pop();
   
  }
}  
  
  
  