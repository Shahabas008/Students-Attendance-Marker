import 'package:collegeproject/Teacher/assignmentteacher.dart';
import 'package:collegeproject/Teacher/attendancecalendarteacher.dart';
import 'package:collegeproject/Teacher/internalmarkteacher.dart';
import 'package:collegeproject/Teacher/notesteacher.dart';
import 'package:collegeproject/Teacher/notificationteacher.dart';
import 'package:collegeproject/Teacher/semestermarkteacher.dart';
import 'package:collegeproject/Teacher/viewstudents.dart';
import 'package:collegeproject/controller/addstudentscontroller.dart';
import 'package:collegeproject/controller/attendancecontroller.dart';
import 'package:collegeproject/controller/createclassdetails.controller.dart';
import 'package:collegeproject/controller/login_controller.dart';
import 'package:collegeproject/controller/markcontroller.dart';
import 'package:collegeproject/controller/notificationcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherMenupage extends StatefulWidget {
  const TeacherMenupage(
      {super.key,
      required this.teachername,
      required this.classname,
      required this.subjectname});
    final String teachername;
  final String classname;
  final String subjectname;

  @override
  State<TeacherMenupage> createState() => _TeacherMenupageState();
}

class _TeacherMenupageState extends State<TeacherMenupage> {
  final data1 = Get.put(Markcontroller());
  final data2 = Get.put(Notificationcontroller());
  final data3 = Get.put(Countercontroller());
  final data4 = Get.put(Attendancecontroller());
  @override
  void initState() {
    super.initState();
    data1.subname1 = widget.subjectname ; 
    data2.subname = widget.subjectname;
    data3.subname = widget.subjectname;
    data4.subname = widget.subjectname;
  }
  final controller = Get.put(LoginController());
  final data = Get.put(Countercontroller());
  final controller2 = Get.put(Createclassdetailscontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
          actions: [
            IconButton(
              onPressed:() {  
                controller2.deleteclass();
              } , icon: const Icon(Icons.delete))
          ],
        ),
        body: (Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SingleChildScrollView(
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
                          Get.to(() => const AttendanceTeacher(),
                          arguments: {
                            "Subjectname" : widget.subjectname,
                          });
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
                          Get.to(() => const Internalmarkteacher(),
                              arguments: {"subjectname": widget.subjectname});
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
                          Get.to(() => Semestermarkteacher(),
                              arguments: {"subject": widget.subjectname});
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
                          Get.to(() => Notesteacher(),
                              arguments: {"subjectname": widget.subjectname});
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
                          Get.to(() =>const Notificationteacherpage(),
                              arguments: {"subjectname": widget.subjectname});
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
                          Get.to(() => Assignmentteacher(),
                          arguments: {
                            "subname" : widget.subjectname
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
                const SizedBox(
                  height: 1,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(350, 50)),
                    onPressed: () {
                      data.addstudents(context);
                    },
                    child: const Text("Add Students"))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
