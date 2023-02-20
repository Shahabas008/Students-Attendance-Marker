import 'package:collegeproject/create_an_account/studentaccountfirstpage.dart';
import 'package:collegeproject/create_an_account/teacheraccountfirstpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      body:
       Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              child: Image.asset('assets/teacherorstudent.png',
              width: 250,
              height: 250,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [],
            ),
           
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(50, 50),
                backgroundColor:const Color.fromARGB(255, 0, 0, 0),
                elevation: 20,
                foregroundColor:const Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Text('TEACHER ACCOUNT'),
              onPressed: () {
                 Get.to(() => const Teacheraccpage1());
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(50, 50),
                backgroundColor:const Color.fromARGB(255, 0, 0, 0),
                elevation: 20,
                foregroundColor:const  Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Text('STUDENT ACCOUNT'),
              onPressed: () {
               Get.to(() => const Studentaccpage1());
              },
            ),
          ],
        ),
      ),
    );
  }
}
