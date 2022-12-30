import 'package:flutter/material.dart';

class Studentaccpage1 extends StatelessWidget {
  const Studentaccpage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Student account SIGN UP',
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
                Navigator.pushNamed(context, "navigatingtostudentaccountsignup2");
              },
              child: const Text('NEXT'),
            ),
          ],
        )
      ],
    ),
  );
}
