import 'package:collegeproject/Teacher/attendance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menupage extends StatelessWidget {
  const Menupage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const  Color.fromARGB(255, 161, 46, 46),
      ),
        body: (Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  backgroundColor:const  Color.fromARGB(255, 161, 46, 46),
                  elevation: 2,
                  foregroundColor:const  Color.fromARGB(255, 255, 255, 255),
                ),
                child: const Text(' ATTENDANCE'),
                onPressed: () {
                Get.to(() => const Attendance());
                },
              ),
            ),

            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  backgroundColor:const   Color.fromARGB(255, 161, 46, 46),
                  elevation: 2,
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: const Text(' INTERNAL MARK'),
                onPressed: () {
                
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  backgroundColor:const  Color.fromARGB(255, 161, 46, 46),
                  elevation: 2,
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: const Text(' SEMESTER EXAM '),
                onPressed: () {
                 
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  backgroundColor: const Color.fromARGB(255, 161, 46, 46),
                  elevation: 2,
                  foregroundColor:const  Color.fromARGB(255, 255, 255, 255),
                ),
                child: const Text(' NOTES'),
                onPressed: () {
                 
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  backgroundColor: const Color.fromARGB(255, 161, 46, 46),
                  elevation: 2,
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: const Text(' NOTIFICATION'),
                onPressed: () {
                 
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  backgroundColor: const Color.fromARGB(255, 161, 46, 46),
                  elevation: 2,
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: const Text(' ASSIGNMENT'),
                onPressed: () {
                 
                },
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
