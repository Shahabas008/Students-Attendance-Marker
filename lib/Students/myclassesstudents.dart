import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Students/menustudents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MYclassstudents extends StatelessWidget {
  const MYclassstudents({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('My-classes')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.docs.isEmpty || snapshot.data == null) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('My Classes'),
                ),
                body: const Center(
                  child: Text(
                    'You haven\'t added any classes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 161, 46, 46),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('My classes'),
                ),
                body: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 15,
                      ),
                      ListView.builder(
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
                                    () => StudentMenupage(
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
              ),
            );
          }
        } else {
          return const Center(
            child: Text('Something Wrong'),
          );
        }
      },
    );
  }
}
