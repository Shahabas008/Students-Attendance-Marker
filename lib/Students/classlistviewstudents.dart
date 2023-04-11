import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Students/menustudents.dart';
import 'package:collegeproject/controller/createclassdetails.controller.dart';
import 'package:collegeproject/controller/requestcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Classlistviewstudents extends StatefulWidget {
  const Classlistviewstudents({super.key});

  @override
  State<Classlistviewstudents> createState() => _ClasslistviewstudentsState();
}

class _ClasslistviewstudentsState extends State<Classlistviewstudents> {
  final data = Get.put(Createclassdetailscontroller());
  final controller = Get.put(Requestcontroller());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Teacher')
          .doc("Classes")
          .collection("Classes")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("Classes"),
              ),
              body: const Center(
                child: Text(
                  'No classes to display',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 161, 46, 46),
                  ),
                ),
              ),
            );
          } else {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
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
                    SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data == null
                              ? 0
                              : snapshot.data!.docs.length,
                          itemBuilder: (_, i) {
                            DocumentSnapshot x = snapshot.data!.docs[i];
                            String classes = x['Class Name'];
                            String subject = x['Subject Name'];
                            User? user = FirebaseAuth.instance.currentUser;
                            bool accept = false;
                            FirebaseFirestore.instance
                                .collection("User")
                                .doc(FirebaseAuth.instance.currentUser!.email)
                                .collection("Subject")
                                .doc("Request")
                                .collection(subject)
                                .doc(user!.displayName)
                                .get()
                                .then((value) {
                              accept = value ["Accept"];
                            });
                            return Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 30, 50, 15),
                              child: GestureDetector(
                                onTap: () {
                                  if (accept == true) {
                                    Get.to(
                                      () => StudentMenupage(
                                          teachername: x['Teacher Name'],
                                          classname: x['Class Name'],
                                          subjectname: x['Subject Name']),
                                    );
                                  } else {
                                    User? user =
                                        FirebaseAuth.instance.currentUser;
                                    String? username = user!.displayName;
                                    controller.usernames = username;
                                    String? email = user.email;
                                    controller.subnames = subject;
                                    controller.sentrequest(
                                        classes, subject, username, email);
                                    controller.sentrequesttoteacher(
                                        username, classes, subject, email);
                                    Get.showSnackbar(const GetSnackBar(
                                      borderRadius: 8,
                                      padding: EdgeInsets.all(20),
                                      title: "A REQUEST SENT TO THE TEACHER",
                                      messageText: Text("A request has been sent to the teacher. You are enable to enter the class when the teacher accepts your request.",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),),
                                      duration: Duration(seconds: 5),
                                      backgroundColor:
                                          Color.fromARGB(255, 161, 46, 46),
                                    ));
                                  }
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
                                                x['Subject Name'],
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
                                                    x['Teacher Name'],
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 153, 153, 153),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    x['Class Name'],
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
                    ),
                  ],
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
