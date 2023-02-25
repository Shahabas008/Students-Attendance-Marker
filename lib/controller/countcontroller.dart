import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Countercontroller extends GetxController {

  


  var count = 0.obs;
  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }
  

  final studentname= TextEditingController();
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
               attendancerecoder();
               
             }, child: const Text('Done'))
            ],
            elevation: 15,
            title: const Text('Add student',
            style: TextStyle(
              color: Color.fromARGB(255, 153, 153, 153)
            ),),
            content: Form(
              key: formkey,
              child: TextFormField(
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
                  labelText: 'Enter Student Name',
                ),
              ),
            ),
          );
        });
  }

  Future attendancerecoder() async{
    if(formkey.currentState!.validate()){
       await FirebaseFirestore.instance.collection('Attendance Recorder').doc().set({
      'student Name' : studentname
    });
     navigator!.pop();
    }
    
  }
}
