import 'package:flutter/material.dart';

class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 234, 234, 234),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                  ),
                ),
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
              child: const Text('TEACHER ACCOUNT'),
              onPressed: () {
                 Navigator.pushNamed(context, "navigatingtoteacheraccountsignup");
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
              child: const Text('STUDENT ACCOUNT'),
              onPressed: () {
                Navigator.pushNamed(context, "navigatingtostudentaccountsignup");
              },
            ),
          ],
        ),
      ),
    );
  }
}
