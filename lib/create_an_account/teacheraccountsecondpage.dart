import 'package:flutter/material.dart';

class Teacheraccpage2 extends StatelessWidget {
  const Teacheraccpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
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
      body: body2(context),
    );
  }
}

@override
Widget body2(BuildContext context) {
  return (Padding(
    padding: const EdgeInsets.fromLTRB(50, 130, 50, 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton(
          hint: const Text(
            'CHOOSE A COURSE',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w200,
            ),
          ),

          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),

          // Array list of items
          items:
              ['BSC. COMPUTER SCIENCE', 'BSC. ELECTRONICS'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            debugPrint(newValue);
          },
        ),
        const SizedBox(
          height: 30,
        ),
        DropdownButton(
          hint: const Text(
            'CHOOSE A SUBJECT',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w200,
            ),
          ),

          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),

          // Array list of items
          items: ['subectssssssssdfgsdfgsdfg'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            debugPrint(newValue);
          },
        ),
        const SizedBox(
          height: 30,
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'ENTER TEACHER CODE',
          ),
        ),
      ],
    ),
  ));
}
