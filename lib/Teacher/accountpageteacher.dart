import 'package:collegeproject/Teacher/myclasses.dart';
import 'package:collegeproject/Teacher/profilepageteacher.dart';
import 'package:collegeproject/controller/login_controller.dart';
import 'package:collegeproject/controller/profilecontrollerpage.dart';
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
  }

  @override
  Widget build(BuildContext context) {
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
                  Positioned(top: 25, child: data1.buildusername()),
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
                      child:  ListTile(
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
                        trailing:const  Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: Container(
                      color: Colors.white,
                      child:  ListTile(
                        onTap: () {
                          Get.to(() => const Myclassespage());
                        },
                        leading: const Icon(
                          Icons.school,
                          color: Color.fromARGB(255, 161, 46, 46),
                        ),
                        title:const  Text('             My Classes',
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
                      child:  ListTile(
                        onTap: () {
                          
                        },
                        leading:const Icon(
                          Icons.notifications,
                          color: Color.fromARGB(255, 161, 46, 46),
                        ),
                        title: const Text('            Notifications',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        trailing:const Icon(Icons.arrow_forward),
                      ),
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
                      child:  ListTile(
                        onTap: () {
                          data.signOut();
                        },
                        leading:const  Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 161, 46, 46),
                        ),
                        title:const  Text('                 Logout',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        trailing:const  Icon(Icons.arrow_forward),
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
