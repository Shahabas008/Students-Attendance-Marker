import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Resources/pdfviewer.dart';
import 'package:collegeproject/controller/markcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notesstudent extends StatelessWidget {
   Notesstudent({super.key});
  final data = Get.put(Markcontroller());
  final subname = Get.arguments["subname"];
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Teacher').doc(subname).collection("Notes")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('There is no notes to display',
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
      ),
    );
  }
}


