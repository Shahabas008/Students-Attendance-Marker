import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:collegeproject/controller/notificationcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notificationstudentpage extends StatelessWidget {
   Notificationstudentpage({super.key});
  final data = Get.put(Notificationcontroller());
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Notification')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('There is no Notification to display',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:  Color.fromARGB(255, 161, 46, 46),
                  ),),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                      
                      shrinkWrap: true,
                      itemCount: snapshot.data == null
                          ? 0
                          : snapshot.data!.docs.length,
                      itemBuilder: (context, i) {
                        DocumentSnapshot x = snapshot.data!.docs[i];
                        return Card(
                        
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:Text(x['Notification']),
                          ));
                      }),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}








