import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class Markcontroller extends GetxController {
  String pdfurl = '';
  String filename = '';
  String subname1 = "";
  String subname = "";

  Future<dynamic> assignment() async {
    //selecting document from the device
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File pick = File(result!.files.single.path.toString());
    var file = pick.readAsBytesSync();
    String name = DateTime.now().millisecondsSinceEpoch.toString();
    filename = basename(pick.path);
    //upload to firebase storage
    var pdfFile = FirebaseStorage.instance.ref().child(name).child('/.pdf');
    UploadTask task = pdfFile.putData(file);
    TaskSnapshot snapshot = await task;
    pdfurl = await snapshot.ref.getDownloadURL();
    //uploading the assignments download url to the firestore database(user student collection)
    await FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("Subject")
        .doc(subname)
        .collection("Assignment")
        .add({"PDF download url": pdfurl, "PDF name": filename});
    //uploading to student collection
    await FirebaseFirestore.instance
        .collection('Student')
        .doc(subname)
        .collection("Assignment")
        .add({"PDF download url": pdfurl, "PDF name": filename});
  }
  Future<dynamic> notes() async {
    //selecting document from the device
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File pick = File(result!.files.single.path.toString());
    var file = pick.readAsBytesSync();
    String name = DateTime.now().millisecondsSinceEpoch.toString();
    filename = basename(pick.path);
    //upload to firebase storage
    var pdfFile = FirebaseStorage.instance.ref().child(name).child('/.pdf');
    UploadTask task = pdfFile.putData(file);
    TaskSnapshot snapshot = await task;
    pdfurl = await snapshot.ref.getDownloadURL();
    //uploading the note pdf download url to the firestore database(User teacher collection)
     await FirebaseFirestore.instance
        .collection('User')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("Subject")
        .doc(subname1)
        .collection("Notes")
        .add({"PDF download url": pdfurl, "PDF name": filename});
    //uploading to teacher collection
    await FirebaseFirestore.instance
        .collection('Teacher')
        .doc(subname1)
        .collection("Notes")
        .add({"PDF download url": pdfurl, "PDF name": filename});
  }


  Future<dynamic> internalmark() async {
    //selecting document from the device
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File pick = File(result!.files.single.path.toString());
    var file = pick.readAsBytesSync();
    String name = DateTime.now().millisecondsSinceEpoch.toString();
    filename = basename(pick.path);
    //upload to firebase storage
    var pdfFile = FirebaseStorage.instance.ref().child(name).child('/.pdf');
    UploadTask task = pdfFile.putData(file);
    TaskSnapshot snapshot = await task;
    pdfurl = await snapshot.ref.getDownloadURL();
    //uploading the intermal mark pdf download url to the firestore database( User teacher collection )
    await FirebaseFirestore.instance
        .collection('User')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("Subject")
        .doc(subname1)
        .collection("Internal-mark")
        .add({"PDF download url": pdfurl, "PDF name": filename});
    //uploading to the Teacher collection
    await FirebaseFirestore.instance
        .collection('Teacher')
        .doc(subname1)
        .collection("Internal-mark")
        .add({"PDF download url": pdfurl, "PDF name": filename});
  }

   Future<dynamic> semestermark() async {
    //selecting document from the device
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File pick = File(result!.files.single.path.toString());
    var file = pick.readAsBytesSync();
    String name = DateTime.now().millisecondsSinceEpoch.toString();
    filename = basename(pick.path);
    //upload to firebase storage
    var pdfFile = FirebaseStorage.instance.ref().child(name).child('/.pdf');
    UploadTask task = pdfFile.putData(file);
    TaskSnapshot snapshot = await task;
    pdfurl = await snapshot.ref.getDownloadURL();
   //uploading the semester mark pdf download url to the firestore database(User teacher collection)
    await FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("Subject")
        .doc(subname1)
        .collection('Semester-Mark')
        .add({"PDF download url": pdfurl, "PDF name": filename});
    //uploading to Teacher collection
    await FirebaseFirestore.instance
        .collection("Teacher")
        .doc(subname1)
        .collection("Semester-Mark")
        .add({"PDF download url": pdfurl, "PDF name": filename});
  }
}
