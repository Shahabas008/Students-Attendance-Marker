import 'package:collegeproject/create_an_account/studentaccountsignup.dart';
import 'package:collegeproject/create_an_account/teacheraccountsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Continue as a'),
        ),
        backgroundColor: const Color.fromARGB(255, 234, 234, 234),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(children: const [
                  Text('We will personalize your experience \n accordingly',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 173, 171, 171)
                  ),),
                ]),
                const SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(50, 50),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 20,
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/teacher.png', width: 100),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Teacher'),
                    ],
                  ),
                  onPressed: () {
                    Get.to(() => const Teacheraccpage1(),
                    arguments: {
                      "user" : 'teacher'
                    });
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(50, 50),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 20,
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/student.png', width: 100),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Student'),
                    ],
                  ),
                  onPressed: () {
                    Get.to(() => const  Studentaccpage1(),
                    arguments: {
                      'user' : 'student'
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
