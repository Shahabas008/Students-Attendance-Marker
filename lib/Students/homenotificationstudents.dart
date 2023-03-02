import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/controller/homenotificationcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeNotificationstudentpage extends StatelessWidget {
  HomeNotificationstudentpage({super.key});
  final data = Get.put(HomeNotificationcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('College Notifications'),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('College Notification')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    'There is no College Notification to display',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 161, 46, 46),
                    ),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                         padding :const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                        child: Text(
                                          x["Time"],
                                          style:const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                        child: Text(
                                          x['Teacher Name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(x['Notification']),
                                  ),
                                ],
                              ));
                        }),
                  ),
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
