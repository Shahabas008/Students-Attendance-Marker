import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/controller/notificationcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notificationteacherpage extends StatelessWidget {
  Notificationteacherpage({super.key});
  final data = Get.put(Notificationcontroller());
  final subname = Get.arguments['subjectname'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
        ),
        body: StreamBuilder(
          stream:
               FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection("Subject").doc(subname).collection("Notification").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    'There is no Notification to display',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 161, 46, 46),
                    ),
                  ),
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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                      child: Text(
                                        x["Time"],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(x['Notification']),
                                ),
                              ],
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
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 161, 46, 46),
            child: const Icon(Icons.add),
            onPressed: () {
              addnotification(context);
            }),
      ),
    );
  }

  //uploading the notification download url to the firestore database
  void notificationregister() async {
    var now = DateTime.now();
    var month = now.month.toString().padLeft(2, '0');
    var day = now.day.toString().padLeft(2, '0');
    var time = '${now.hour}:${now.minute}  ${now.year}-$month-$day ';
    if (data.formkey.currentState!.validate()) {
      await FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection("Subject").doc(subname).collection("Notification")
          .add({"Notification": data.notification.text, "Time": time});
      // await FirebaseFirestore.instance
      //     .collection('User-Notification')
      //     .doc(currentuser)
      //     .collection('My-notification')
      //     .add({"Notification": data.notification.text, "Time": time});
    }
    navigator!.pop();
  }

  //the notification popup doalog box
  void addnotification(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 153, 153, 153)),
                  onPressed: () {
                    notificationregister();
                  },
                  child: const Text('Done'))
            ],
            elevation: 15,
            title: const Text(
              'Notification',
              style: TextStyle(color: Color.fromARGB(255, 153, 153, 153)),
            ),
            content: Form(
              key: data.formkey,
              child: TextFormField(
                controller: data.notification,
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
}
