import 'package:collegeproject/create_an_account/loginpage.dart';
import 'package:collegeproject/create_an_account/studentaccountsecondpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Studentaccpage1 extends StatelessWidget {
  const Studentaccpage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
       
        title: const Text(
          'Student Account SIGN UP',
          
        ),
      ),
      body: body1(context),
    );
  }
}

@override
Widget body1(BuildContext context) {
  final formkey = GlobalKey<FormState>();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  
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
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                labelText: 'First Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: lastname,
              decoration:const  InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Last Name',
                prefixIcon: Icon(Icons.person)
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             TextFormField(
              controller: email,
              decoration:const  InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail ',
                prefixIcon:Icon(Icons.email) 
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             TextFormField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password ',
                prefixIcon: Icon(Icons.password)
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration:const  InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password Confirmation',
                prefixIcon: Icon(Icons.password)
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
                    Get.to(() =>const Studentaccpage2());
                  },
                  child: const Text('NEXT'),
                ),
                
              ],
              
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
