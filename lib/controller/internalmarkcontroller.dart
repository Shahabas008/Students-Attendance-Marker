import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class Internalmarkcontroller extends GetxController {
  String pdfurl = '';
  Future<dynamic> selectdocument() async {
    //selecting document from the device
   FilePickerResult? result = await FilePicker.platform.pickFiles();
   File pick = File(result!.files.single.path.toString());
   var file = pick.readAsBytesSync();
   String name = DateTime.now().millisecondsSinceEpoch.toString();
   //upload to firebase storage 
   var pdfFile = FirebaseStorage.instance.ref().child(name).child('/.pdf');
   UploadTask task =pdfFile.putData(file);
   TaskSnapshot snapshot = await task;
   pdfurl = await snapshot.ref.getDownloadURL();
   //uploading the pdf download url to the firestore database 
   await FirebaseFirestore.instance.collection('Internal Mark PDF').doc().set({
    "PDF download url" : pdfurl,
   });


  }

}
