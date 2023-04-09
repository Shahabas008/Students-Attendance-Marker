import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Requestdetailspage extends StatefulWidget {
  const Requestdetailspage({super.key});

  @override
  State<Requestdetailspage> createState() => _RequestdetailspageState();
}

class _RequestdetailspageState extends State<Requestdetailspage> {
  @override
  Widget build(BuildContext context) {
    final subnames = Get.arguments["subjectname"];
    bool accept = false;

    setState(() {
      
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Request from students"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Student")
              .doc("Request")
              .collection(subnames)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return const Scaffold(
                  body: Center(
                    child: Text(
                      'You have no Requests ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 161, 46, 46),
                      ),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount:
                        snapshot.data == null ? 0 : snapshot.data!.docs.length,
                    itemBuilder: (_, index) {
                      DocumentSnapshot x = snapshot.data!.docs[index];
                      String studentname = x["Student Name"];
                      String email = x["E-Mail"];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(50, 30, 50, 15),
                        child: Card(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          elevation: 15,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              height: 118,
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        x["Student Name"] +
                                            " is requested to join " +
                                            x["Subject"] +
                                            '\nclass of ' +
                                            x["Class"] +
                                            ".",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  accept == true
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Accepted",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(
                                              Icons.check_box,
                                              color: Colors.green,
                                            )
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection("Student")
                                                    .doc("Request")
                                                    .collection(subnames)
                                                    .doc(studentname)
                                                    .update({"Accept": true});
                                                FirebaseFirestore.instance
                                                    .collection("User")
                                                    .doc(email)
                                                    .collection("Subject")
                                                    .doc("Request")
                                                    .collection(subnames)
                                                    .doc(studentname)
                                                    .update({"Accept": true});
                                                Get.showSnackbar(GetSnackBar(
                                                  borderRadius: 8,
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  messageText: Text(
                                                    "You have accepted the request of " +
                                                        x["Student Name"],
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  duration: const Duration(
                                                      seconds: 3),
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 161, 46, 46),
                                                ));
                                              },
                                              child: Row(
                                                children: const [
                                                  Text("Accept"),
                                                  Icon(Icons.check,
                                                      color: Colors.green),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection("Student")
                                                    .doc("Request")
                                                    .collection(subnames)
                                                    .doc(studentname)
                                                    .delete();
                                                    FirebaseFirestore.instance
                                                    .collection("User")
                                                    .doc(email)
                                                    .collection("Subject")
                                                    .doc("Request")
                                                    .collection(subnames)
                                                    .doc(studentname)
                                                    .delete();
                                              },
                                              child: Row(
                                                children: const [
                                                  Text("Decline"),
                                                  Icon(
                                                    Icons.close,
                                                    color: Color.fromARGB(
                                                        255, 161, 46, 46),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                ],
                              )),
                        ),
                      );
                    });
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
