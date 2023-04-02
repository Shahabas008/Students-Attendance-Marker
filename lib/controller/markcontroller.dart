import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class Markcontroller extends GetxController {
  String pdfurl = '';
  String filename = '';
  // RxString subname1 = "".obs ; 
    Future<dynamic> selectdocument() async {
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
  }
}
