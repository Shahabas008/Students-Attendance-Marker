import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Resources/pdfviewer.dart';
import 'package:collegeproject/controller/markcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Internalmarkteacher extends StatefulWidget {
  const  Internalmarkteacher({super.key});

  @override
  State<Internalmarkteacher> createState() => _InternalmarkteacherState();
}

class _InternalmarkteacherState extends State<Internalmarkteacher> {
  final data = Get.put(Markcontroller());
  final subname = Get.arguments['subjectname'];

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Internal Mark'),
        ),
        body: StreamBuilder(
          stream:FirebaseFirestore.instance
        .collection('User')
        .doc(FirebaseAuth.instance.currentUser!.email).collection("Subject").doc(subname).collection("Internal-mark")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return const Center(
                 child: Text('There is no Internal marks to display',
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
                        return SizedBox(
                          height: 50,
                          child: Card(
                              child: GestureDetector(
                                  onTap: () => Get.to(() => const PDFViewer(),
                                  arguments: {
                                    "PDFURL" : x["PDF download url"]
                                  }),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(x['PDF name'])))),
                        );
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
              data.internalmark();
            }),
      ),
    );
  }

   
}

