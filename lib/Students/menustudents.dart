import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/Students/assignmentsstudents.dart';
import 'package:collegeproject/Students/attendancestudents.dart';
import 'package:collegeproject/Students/internalmarkstudents.dart';
import 'package:collegeproject/Students/notesstudents.dart';
import 'package:collegeproject/Students/notificationstudents.dart';
import 'package:collegeproject/Students/semesterstudent.dart';
import 'package:collegeproject/controller/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentMenupage extends StatelessWidget {
  StudentMenupage(
      {super.key,
      required this.teachername,
      required this.classname,
      required this.subjectname});
  final controller = Get.put(LoginController());
  final String teachername;
  final String classname;
  final String subjectname;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    addtomyclasses();
                  },
                  icon: const Icon(Icons.add))
            ],
            centerTitle: true,
            title: Text(
              subjectname,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 161, 46, 46),
          ),
          body: (Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 250,
                  height: 70,
                  child: Card(
                    elevation: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          classname,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const VerticalDivider(
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                          color: Color.fromARGB(255, 153, 153, 153),
                        ),
                        Text(
                          teachername,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(120, 100)),
                        onPressed: () {
                          Get.to(
                            () => AttendanceStudents(
                              classname: classname,
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/attendance.png',
                              width: 50,
                              height: 50,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Attendance',
                              style: TextStyle(
                                color: Color.fromARGB(255, 153, 153, 153),
                              ),
                            )
                          ],
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(120, 100)),
                        onPressed: () {
                          Get.to(() => Internalmarkstudent());
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/internalandsem.png',
                              width: 50,
                              height: 50,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Internal\n  Mark',
                              style: TextStyle(
                                color: Color.fromARGB(255, 153, 153, 153),
                              ),
                            )
                          ],
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(120, 100)),
                        onPressed: () {
                          Get.to(() => Semestermarkstudent());
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/sem.png',
                              width: 50,
                              height: 50,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Semester\n    Mark',
                              style: TextStyle(
                                color: Color.fromARGB(255, 153, 153, 153),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(120, 100)),
                        onPressed: () {
                          Get.to(() => Notesstudent());
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/note.png',
                              width: 50,
                              height: 50,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Notes',
                              style: TextStyle(
                                color: Color.fromARGB(255, 153, 153, 153),
                              ),
                            )
                          ],
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(120, 100)),
                        onPressed: () {
                          Get.to(() => Notificationstudentpage());
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/notification.png',
                              width: 50,
                              height: 50,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Notification',
                              style: TextStyle(
                                color: Color.fromARGB(255, 153, 153, 153),
                              ),
                            )
                          ],
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(120, 100)),
                        onPressed: () {
                          Get.to(() => Assignmentstudents(),
                          arguments: {
                            'subjectname' : subjectname
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/assignment.png',
                              width: 50,
                              height: 50,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Assignment',
                              style: TextStyle(
                                color: Color.fromARGB(255, 153, 153, 153),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ))),
    );
  }

  //adding the students class to my class page on account page
  void addtomyclasses() async {
    final currentuser = FirebaseAuth.instance.currentUser!.email;
    await FirebaseFirestore.instance
        .collection('User-Student-classes')
        .doc(currentuser)
        .collection('My-classes')
        .add({
      "Teacher Name": teachername,
      "Class Name": classname,
      "Subject Name": subjectname,
    });
    Get.showSnackbar(const GetSnackBar(
      borderRadius: 8,
      padding: EdgeInsets.all(20),
      messageText: Text(
        'Added to My classes',
        style: TextStyle(
          color: Color.fromARGB(255, 161, 46, 46),
        ),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.white,
    ));
  }
}
