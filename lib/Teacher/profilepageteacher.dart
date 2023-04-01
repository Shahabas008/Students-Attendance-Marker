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
  @override
  void initState() {
    super.initState();
    setState(() {
      data1.collectionreferenceuser.doc(FirebaseAuth.instance.currentUser!.email).get().then((value) {
        data1.firstname = value['First Name'];
        data1.lastname = value['Last Name'];
        data1.email = value['E-Mail'];
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
                      //updating the email
                    },
                    icon: const Icon(Icons.update))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${data1.firstname} ${data1.lastname}',
              style: const TextStyle(fontSize: 20),
            ),
            const Divider(
              height: 50,
              indent: 45,
              endIndent: 45,
              color: Colors.black,
            ),
            const Text(
              'E-Mail',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data1.email,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    ));
  }
}
