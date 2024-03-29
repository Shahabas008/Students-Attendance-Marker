import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/controller/profilecontrollerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profilepageteacher extends StatefulWidget {
  const Profilepageteacher({super.key});

  @override
  State<Profilepageteacher> createState() => _ProfilepageteacherState();
}

class _ProfilepageteacherState extends State<Profilepageteacher> {
  final data1 = Get.put(Profilepagecontroller());
  String firstname = '';
  String lastname = '';
  String email = '';
  @override
  void initState() {
    super.initState();
    setState(() {
      FirebaseFirestore.instance.collection("User")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get()
          .then((value) {
        firstname = value['First Name'];
        lastname = value['Last Name'];
        email = value['E-Mail'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      data1.showUsernameupdate(context);
                    },
                    icon: const Icon(Icons.update))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$firstname $lastname',
              style: const TextStyle(fontSize: 20),
            ),
            const Divider(
              height: 50,
              indent: 45,
              endIndent: 45,
              color: Colors.black,
            ),
            Row(
              children: const [
                Text(
                  'E-Mail',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              email,
              style: const TextStyle(fontSize: 20),
            ),
           
          ],
        ),
      ),
    ));
  }
}
