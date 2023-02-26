import 'package:collegeproject/controller/sign_up_controller.dart';
import 'package:collegeproject/create_an_account/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Teacheraccpage1 extends StatefulWidget {
  const Teacheraccpage1({super.key});

  @override
  State<Teacheraccpage1> createState() => _Teacheraccpage1State();
}

class _Teacheraccpage1State extends State<Teacheraccpage1> {
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
          appBar: AppBar(
            title: const Text(
              'Account Details',
            ),
          ),
          body: Form(
            key: data.formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                child: Column(
                  children: [
                    Row(children: const [
                       Text(
                        'Please Enter Your Details',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'The field is required';
                        } else if (value.length < 4) {
                          return 'Enter at least 4 characters';
                        } else {
                          return null;
                        }
                      }),
                      controller: data.firstname,
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
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'The field is required';
                        } else if (value.length < 4) {
                          return 'Enter at least 4 characters';
                        } else {
                          return null;
                        }
                      }),
                      controller: data.lastname,
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
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      controller: data.email,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: ((value) {
                        if(value!.isEmpty){
                          return 'Please Enter Password';
                        }
                        
                        else if (value.length < 6) {
                          return 'Password is too short';
                        }else {
                          return null;
                        }
                      }),
                      controller: data.password,
                      obscureText: data.obscureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: _toggle,
                          icon: data.obscureText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        prefixIcon: const Icon(Icons.fingerprint),
                        border: const OutlineInputBorder(),
                        labelText: 'Password ',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value != data.password.text) {
                          return 'The password don\'t match ';
                        } else {
                          return null;
                        }
                      }),
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.fingerprint),
                        labelText: 'Password Confirmation',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(350, 50)),
                          onPressed: () {
                            SignUpController.instance
                                .createuser(data.email.text, data.password.text);
                            SignUpController.instance.registeruserteacher(
                                data.email.text,
                                data.firstname.text,
                                data.lastname.text);
                          },
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        'Already have an account ?',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const Loginpage());
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(fontSize: 20),
                          ))
                    ])
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
