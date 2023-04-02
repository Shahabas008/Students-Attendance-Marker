import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Students/menustudents.dart';
import 'package:collegeproject/Teacher/createclass.dart';
import 'package:collegeproject/controller/createclassdetails.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Classlistviewstudents extends StatelessWidget {
  Classlistviewstudents({super.key});
  final data = Get.put(Createclassdetailscontroller());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Teacher')
          .doc("Classes").collection(data.subname)
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(
              child:   Text('No classes to display',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:  Color.fromARGB(255, 161, 46, 46),
                  ),),);
          } else {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Classes'),
                ),
                body: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Select One Card To View ',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data == null
                            ? 0
                            : snapshot.data!.docs.length,
                           
                          itemBuilder: (_, i) {
                             DocumentSnapshot x = snapshot.data!.docs[i];
                            return Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 30, 50, 15),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => StudentMenupage(
                                        teachername: x['Teacher Name'],
                                        classname: x['Class Name'],
                                        subjectname: x['Subject Name']),
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
