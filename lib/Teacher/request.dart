import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Teacher/requestdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Requestpage extends StatelessWidget {
  const Requestpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("User")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection("Subject")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: Text(
                    'You don\'t have any requests.',
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
                  title: const Text("Request"),
                ),
                body: Column(children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Select a Class to view Requests from students",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data == null
                            ? 0
                            : snapshot.data!.docs.length,
                        itemBuilder: (_, index) {
                          DocumentSnapshot x = snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => const Requestdetailspage(),
                                    arguments: {
                                      "subjectname": x["Subject Name"],
                                    });
                              },
                              child: SizedBox(
                                height: 50,
                                child: Card(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      x["Subject Name"],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ]),
              ),
            );
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
