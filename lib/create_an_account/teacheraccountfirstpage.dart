import 'package:flutter/material.dart';

class Teacheraccpage1 extends StatefulWidget {
  const Teacheraccpage1({super.key});

  @override
  State<Teacheraccpage1> createState() => _Teacheraccpage1State();
}

class _Teacheraccpage1State extends State<Teacheraccpage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Teacher account SIGN UP',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
      ),
      body: body1(context),
    );
  }
}

@override
Widget body1(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
    child: Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'First Name',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Last Name',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'E-mail Name',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password ',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password Confirmation',
          ),
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize:const Size(20, 50)
              ),
              onPressed: () {
                Navigator.pushNamed(context, "navigatingtoteacheraccountsignup2");
              },
              child: const Text('NEXT'),
            ),
          ],
        )
      ],
    ),
  );
}

