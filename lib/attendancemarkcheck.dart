import 'package:flutter/material.dart';

class Attendancemarkcheck extends StatelessWidget {
  const Attendancemarkcheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: const Text(
            'Student Attendence Marker',
          ),
          centerTitle: true,
        ),
      backgroundColor:const Color.fromARGB(255, 234, 234, 234),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                
              ],
            ),
            const SizedBox(height: 200,),
            ElevatedButton(
              
              style:ElevatedButton.styleFrom(
               minimumSize:const Size(50, 50),
              backgroundColor: Colors.white,
              elevation: 20,
              foregroundColor: Colors.black,
              ),
              child: const Text('Mark Attendance'),
              onPressed: () {
                 Navigator.pushNamed(context, "navigatingtoclassselectionpage");
              },
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                 minimumSize:const Size(50, 50),
              backgroundColor: Colors.white,
              elevation: 20,
              foregroundColor: Colors.black,
              ),
              child: const Text('Check Attendace'),
              onPressed: () {
                Navigator.pushNamed(context, "navigatingtoclassselectionpage");
              },
            ),
          ],
        ),
      ),
    );
  }
}
