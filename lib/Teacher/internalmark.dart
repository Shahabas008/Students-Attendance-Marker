import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/controller/internalmarkcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Internalmark extends StatelessWidget {
   Internalmark({super.key});
  final data = Get.put(Internalmarkcontroller());
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Internal Mark'),
        ),
        body: Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Internal Mark PDF')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('There is no Internal marks to show'),
                  );
                } else {
                  return Expanded(
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
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 161, 46, 46),
            child: const Icon(Icons.add),
            onPressed: () {
              data.selectdocument();
            }),
      ),
    );
  }
}

class View extends StatefulWidget {
  const View({super.key});

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  final _pdfViewerController = PdfViewerController();

  final data = Get.put(Internalmarkcontroller());

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
