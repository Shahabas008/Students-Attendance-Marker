import 'package:collegeproject/Students/myclassesstudents.dart';
import 'package:collegeproject/Teacher/profilepageteacher.dart';
import 'package:collegeproject/controller/login_controller.dart';
import 'package:collegeproject/controller/profilecontrollerpage.dart';
import 'package:collegeproject/controller/sign_up_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Accountpagestudents extends StatefulWidget {
  const Accountpagestudents({super.key});

  @override
  State<Accountpagestudents> createState() => _AccountpagestudentsState();
}

class _AccountpagestudentsState extends State<Accountpagestudents> {
  final data = Get.put(LoginController());
  final data1 = Get.put(Profilepagecontroller());
  final data2 = Get.put(SignUpController());
  User user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    data1.collectionreferenceuser.doc(data1.currentUser).get().then((value) {
      setState(() {
        data1.firstname = value['First Name'];
        data1.lastname = value['Last Name'];
        data1.email = value['E-Mail'];
      });
      data1.collectionreferenceprofile
          .doc(data1.currentUser)
          .get()
          .then((value) {
        setState(() {
          data1.profileurl = value['Profile Picture'];
        });
      });
    });
    data2.checkEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    if (user.emailVerified) {
      setState(() {
        data2.isEmailVerified = true;
      });
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                  Positioned(top: 120, child: data1.buildprofilecover()),
                  Positioned(top: 30, child: data1.buildusername()),
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
                        title: const Text('                 Profile',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
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
                          Get.to(() => const MYclassstudents());
                        },
                        leading: const Icon(
                          Icons.school,
                          color: Color.fromARGB(255, 161, 46, 46),
                        ),
                        title: const Text('             My Classes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        trailing: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.notifications,
                          color: Color.fromARGB(255, 161, 46, 46),
                        ),
                        title: const Text('            Notifications',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
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
                            if (!data2.isEmailVerified) {
                             data2.sendverificationemail();
                            } else {
                              Get.showSnackbar(const GetSnackBar(
                                padding: EdgeInsets.all(15),
                                messageText: Text(
                                    "The verification E-Mail hasn't send."),
                              ));
                            }
                          },
                          leading: const Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 161, 46, 46),
                          ),
                          title: const Text('             verify E-Mail',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          trailing: data2.isEmailVerified
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
                        title: Text('                settings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
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
                        title: const Text('                 Logout',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
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
}
