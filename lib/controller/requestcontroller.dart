import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Requestcontroller extends GetxController {
  String subnames = "";
  String classes = '';
  String? usernames = '';
  User? user = FirebaseAuth.instance.currentUser;
  void sentrequest(
      String classes, String subname, String? username, String? email) async {
    // uploading to the students email
    await FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("Subject")
        .doc("Request")
        .collection(subname)
        .doc(username)
        .set({
      "Student Name": username,
      "E-Mail": email,
      "Class": classes,
      "Subject": subname,
      "Accept": false,
      "UID": user!.uid
    });
  }

  void sentrequesttoteacher(
      String? username, String classes, String subname, String? email) async {
    //uploading the data for teachers
    await FirebaseFirestore.instance
        .collection("Student")
        .doc("Request")
        .collection(subname)
        .doc(usernames)
        .set({
      "Student Name": usernames,
      "Class": classes,
      "E-Mail": email,
      "Subject": subname,
      "Accept": false,
      "UID": user!.uid
    });
  }
}
