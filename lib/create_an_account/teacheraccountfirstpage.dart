import 'package:collegeproject/create_an_account/loginpage.dart';
import 'package:collegeproject/create_an_account/teacheraccountsecondpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        
        title: const Text(
          'Teacher account SIGN UP',
         
        ),
      ),
      body: body1(context),
    );
  }
}

@override
Widget body1(BuildContext context) {
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();


  return Form(
    key: formkey,
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
        child: Column(
          children: [
             TextFormField(
              controller: firstname,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: lastname,
              decoration: const InputDecoration(
                 prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: 'Last Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             TextFormField(
              controller: email,
              decoration:const  InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration:const  InputDecoration(
                prefixIcon:Icon(Icons.password) ,
                border: OutlineInputBorder(),
                labelText: 'Password ',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password) ,
                labelText: 'Password Confirmation',
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50)
                  ),
                  onPressed: () {
                    Get.to(() => const Teacheraccpage2());
                  },
                  child: const Text('NEXT'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 const Text('Already have an account ?',
                 style: TextStyle(
                  fontSize: 15
                 ),
              ),
              TextButton(onPressed: () {
                Get.to(() => const Loginpage());
              }, child: const Text('Log In',
              style: TextStyle(
                fontSize: 20
              ),))
              ]
            )
          ],
        ),
      ),
    ),
  );
}

