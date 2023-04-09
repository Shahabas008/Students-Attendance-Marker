import 'package:collegeproject/Students/assignmentsstudents.dart';
import 'package:collegeproject/Students/attendancestudents.dart';
import 'package:collegeproject/Students/internalmarkstudents.dart';
import 'package:collegeproject/Students/notesstudents.dart';
import 'package:collegeproject/Students/notificationstudents.dart';
import 'package:collegeproject/Students/semesterstudent.dart';
import 'package:collegeproject/Teacher/viewstudents.dart';
import 'package:collegeproject/controller/createclassdetails.controller.dart';
import 'package:collegeproject/controller/login_controller.dart';
import 'package:collegeproject/controller/markcontroller.dart';
import 'package:collegeproject/controller/requestcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentMenupage extends StatefulWidget {
  const StudentMenupage(
      {super.key,
      required this.teachername,
      required this.classname,
      required this.subjectname});
  final String teachername;
  final String classname;
  final String subjectname;

  @override
  State<StudentMenupage> createState() => _StudentMenupageState();
}

class _StudentMenupageState extends State<StudentMenupage> {
  final controller = Get.put(LoginController());
  final controller1 = Get.put(Markcontroller());
  final controller2 = Get.put(Createclassdetailscontroller());
  @override
  void initState() {
    super.initState();
    controller1.subname = widget.subjectname;
    controller2.subname = widget.subjectname;
    controller2.classes = widget.classname;
    controller2.teacher = widget.teachername;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    controller2.addtomyclasses();
                  },
                  icon: const Icon(Icons.add))
            ],
            centerTitle: true,
            title: Text(
              widget.subjectname,
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
                          widget.classname,
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
                          widget.teachername,
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
                            () => const AttendanceStudents(),
                            arguments: {
                              "subname": widget.subjectname
                            }
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
                          Get.to(() => Internalmarkstudent(),
                              arguments: {"subname": widget.subjectname});
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
                          Get.to(() => Semestermarkstudent(),
                              arguments: {"subname": widget.subjectname});
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
                          Get.to(() => Notesstudent(),
                              arguments: {"subname": widget.subjectname});
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
                          Get.to(() => Notificationstudentpage(),
                              arguments: {"subname": widget.subjectname});
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
                          Get.to(() => const Assignmentstudents(),
                              arguments: {'subjectname': widget.subjectname});
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
                            ),
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(350, 50)),
                    onPressed: () {
                      Get.to(() => const Studentsviewteacher(),
                      arguments: {
                        "Subjectname" : widget.subjectname
                      });
                    },
                    child: const Text("Students List ")),
              ],
            ),
          ))),
    );
  }

  
}
