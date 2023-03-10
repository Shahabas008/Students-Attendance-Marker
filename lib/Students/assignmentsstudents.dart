import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/controller/markcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Assignmentstudents extends StatelessWidget {
   Assignmentstudents({super.key});
  final data = Get.put(Markcontroller());
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Assignment'),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Assignments')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return const Center(
                 child: Text('There is no Assignments to display',
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
                        return Text(x['PDF download url']);
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
              data.selectdocument();
              data.assignmentsregister();
            }),
      ),
    );
  }
}

class View extends StatelessWidget {
   View({super.key});

  final _pdfViewerController = PdfViewerController();

  final data = Get.put(Markcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pdf viewer'),
      ),
      body: SfPdfViewer.network(
        data.pdfurl,
        controller: _pdfViewerController,
      ),
    );
  }
}
