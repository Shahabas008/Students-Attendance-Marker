import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Teacher/createclass.dart';
import 'package:collegeproject/Teacher/createclassdetails.dart';
import 'package:collegeproject/Teacher/menuteacher.dart';
import 'package:collegeproject/controller/createclassdetails.controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Classlistviewteacher extends StatelessWidget {
  Classlistviewteacher({super.key});
  final data = Get.put(Createclassdetailscontroller());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('Subject')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.docs.isEmpty || snapshot.data == null) {
            return const Createclass();
          } else {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Get.to(() => Createclassdetails());
                      },
                      icon: const Icon(Icons.add)),
                  centerTitle: true,
                  title: const Text('Classes'),
                ),
                body: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Select One Card To View ',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data == null
                            ? 0
                            : snapshot.data!.docs.length,
                        itemBuilder: (_, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          return Padding(
                            padding:
                                const EdgeInsets.fromLTRB(50, 30, 50, 15),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => TeacherMenupage(
                                      teachername:
                                          documentSnapshot['Teacher Name'],
                                      classname:
                                          documentSnapshot['Class Name'],
                                      subjectname:
                                          documentSnapshot['Subject Name']),
                                );
                              },
                              child: Card(
                                color:
                                    const Color.fromARGB(255, 255, 255, 255),
                                elevation: 15,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 30),
                                    height: 100,
                                    width: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              documentSnapshot[
                                                  'Subject Name'],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 153, 153, 153),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  documentSnapshot[
                                                      'Teacher Name'],
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 153, 153, 153),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  documentSnapshot[
                                                      'Class Name'],
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 153, 153, 153),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            );
          }
        } else {
          return const Center(
            child: Text(
              'Something went wrong',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 161, 46, 46),
              ),
            ),
          );
        }
      },
    );
  }
}
