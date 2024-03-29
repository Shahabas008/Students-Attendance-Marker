import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Resources/my_flutter_app_icons.dart';
import 'package:collegeproject/Teacher/profilepageteacher.dart';
import 'package:collegeproject/Teacher/request.dart';
import 'package:collegeproject/Teacher/verifyemail.dart';
import 'package:collegeproject/config/color.dart';
import 'package:collegeproject/controller/login_controller.dart';
import 'package:collegeproject/controller/profilecontrollerpage.dart';
import 'package:collegeproject/controller/sign_up_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Accountpageteacher extends StatefulWidget {
  const Accountpageteacher({super.key});

  @override
  State<Accountpageteacher> createState() => _ProfileteacherState();
}

class _ProfileteacherState extends State<Accountpageteacher> {
  final data = Get.put(LoginController());
  final data1 = Get.put(Profilepagecontroller());
  final data2 = Get.put(SignUpController());
  String firstname = '';
  String lastname = '';
  String profileurl = '';
  String email = '';
  User user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    data1.collectionreferenceuser
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((value) {
      setState(() {
        firstname = value['First Name'];
        lastname = value['Last Name'];
        email = value["E-Mail"];
      });
      FirebaseFirestore.instance
          .collection("User")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get()
          .then((value) {
        setState(() {
          profileurl = value['Profile-Picture'];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool checks = false;
    setState(() {
      user.reload();
      if (user.emailVerified) {
        checks = true;
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SECONDARY_COLOUR,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Account',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200,
                    color: const Color.fromARGB(255, 161, 46, 46),
                  ),
                  Positioned(top: 120, child: buildprofilecover()),
                  Positioned(top: 25, child: buildusername()),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => const Profilepageteacher());
                        },
                        leading: const Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 161, 46, 46),
                        ),
                        title: const Align(
                          child:  Text('Profile',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        trailing: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: Container(
                      color: Colors.white,
                      child:   ListTile(
                        onTap:(){
                           Get.to(() => const Requestpage());
                        },
                        leading:const Icon(
                          MyFlutterApp.user_plus,
                          color: Color.fromARGB(255, 161, 46, 46),
                        ),
                        title: const Align(
                          child: Text('Request',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        trailing: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                          onTap: () {
                            Get.to(() => const Verifyemailpage(),
                                arguments: {"email": email});
                          },
                          leading: const Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 161, 46, 46),
                          ),
                          title: const Align(
                            child:   Text('verify E-Mail',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          trailing: checks
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                )),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: Container(
                      color: Colors.white,
                      child: const ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 161, 46, 46),
                        ),
                        title: Align(
                          child: Text('settings',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        trailing: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {
                          data.signOut();
                        },
                        leading: const Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 161, 46, 46),
                        ),
                        title: const Align(
                          child:   Text('Logout',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        trailing: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('AttendEase 2023')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildprofilecover() {
    return GestureDetector(
      onTap: () {
        data1.showPicker(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 234, 234, 234),
            borderRadius: BorderRadius.circular(10)),
        height: 150,
        width: 140,
        child: SizedBox(
          height: 130,
          width: 200,
          child: profileurl == ''
              ? Image.asset('assets/user.jpg')
              : Image.network(
                  profileurl,
                ),
        ),
      ),
    );
  }

  Widget buildusername() {
    return Text(
      '$firstname $lastname',
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
