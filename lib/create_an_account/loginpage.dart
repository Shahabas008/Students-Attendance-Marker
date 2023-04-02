import 'package:collegeproject/controller/login_controller.dart';
import 'package:collegeproject/controller/sign_up_controller.dart';
import 'package:collegeproject/create_an_account/reset_password.dart';
import 'package:collegeproject/create_an_account/signup.dart';
import 'package:collegeproject/home/appbar_bottomnavteacher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final controller = Get.put(LoginController());
  final data = Get.put(SignUpController());
  void _toggle() {
    setState(() {
      data.obscureText = !data.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 234, 234, 234),
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return const Homepagelayout();
              } else {
                return Form(
                  key: controller.formkey,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                          ),
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              controller: controller.email,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                                labelText: 'E-Mail',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter Password!';
                                }
                                return null;
                              },
                              obscureText: data.obscureText,
                              controller: controller.password,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: _toggle,
                                  icon: data.obscureText
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
                                prefixIcon: const Icon(Icons.fingerprint),
                                border: const OutlineInputBorder(),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => const Resetpasswordpage());
                            },
                            child: const Text(
                              'Forgot Password',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                              height: 50,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ElevatedButton(
                                child: const Text('Login'),
                                onPressed: () {
                                  LoginController.instance.signIn(
                                      controller.email.text.trim(),
                                      controller.password.text.trim());
                                },
                              )),
                          const SizedBox(
                            height: 10,
                          ),
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
                );
              }
            }),
      ),
    );
  }
}
