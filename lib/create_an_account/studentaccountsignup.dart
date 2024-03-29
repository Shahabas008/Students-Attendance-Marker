import 'package:collegeproject/controller/sign_up_controller.dart';
import 'package:collegeproject/create_an_account/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Studentaccpage1 extends StatefulWidget {
  const Studentaccpage1({super.key});

  @override
  State<Studentaccpage1> createState() => _Studentaccpage1State();
}

class _Studentaccpage1State extends State<Studentaccpage1> {
  final users = Get.arguments['user'];
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
                    Row(
                      children: const [
                        Text('Please Enter Your Details',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                        ),)
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
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
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'First Name',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
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
                          border: OutlineInputBorder(),
                          labelText: 'Last Name',
                          prefixIcon: Icon(Icons.person)),
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
                          border: OutlineInputBorder(),
                          labelText: 'E-mail ',
                          prefixIcon: Icon(Icons.email)),
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
                          border: const OutlineInputBorder(),
                          labelText: 'Password ',
                          prefixIcon: const Icon(Icons.fingerprint)),
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
                          labelText: 'Password Confirmation',
                          prefixIcon: Icon(Icons.fingerprint)),
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
                          onPressed: () async {
                            SignUpController.instance.registeruserteacherandstudent(
                                data.email.text,
                                data.firstname.text,
                                data.lastname.text,
                                users);
                            SignUpController.instance
                                .createuser(data.email.text, data.password.text , data.firstname.text);
                                data.email.clear();
                                data.firstname.clear();
                                data.lastname.clear();
                                data.password.clear();
                          },
                          child: const Text('SIGN UP'),
                        ),
                      ],
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
