import 'package:collegeproject/Resources/login_controller.dart';
import 'package:collegeproject/create_an_account/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
   final data = Get.put(LoginController()) ;
   final emailController = TextEditingController();
   final passwordController = TextEditingController();
   final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 234, 234, 234),
        body: 
         Form(
          key: formkey,
           child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.bold),
    
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-Mail',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                   
                    child: const Text(
                      'Forgot Password',
                    ),
                  ),
                  const  SizedBox(height: 10),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                        LoginController().loginUser(emailController.text.trim(), passwordController.text.trim());
                        },
                      )),
                      const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                        Get.to(() => const Signuppage());
                        },
                      )
                    ],
                    
                  ),
                ],
              )),
         ),
      ),
    );
  }
}
