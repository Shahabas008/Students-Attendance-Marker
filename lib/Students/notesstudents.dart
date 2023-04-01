import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/controller/markcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Notesstudent extends StatelessWidget {
   Notesstudent({super.key});
  final data = Get.put(Markcontroller());
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Note PDF')
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
    );
  }
}

// class View extends StatefulWidget {
//   const View({super.key});

//   @override
//   State<View> createState() => _ViewState();
// }

// class _ViewState extends State<View> {
//   final _pdfViewerController = PdfViewerController();

//   final data = Get.put(Markcontroller());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('pdf viewer'),
//       ),
//       body: SfPdfViewer.network(
//         data.pdfurl,
//         controller: _pdfViewerController,
//       ),
//     );
//   }
// }
