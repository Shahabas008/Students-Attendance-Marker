import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verifyemailpage extends StatefulWidget {
  const Verifyemailpage({super.key});

  @override
  State<Verifyemailpage> createState() => VerifyemailpageState();
}

class VerifyemailpageState extends State<Verifyemailpage> {
  final auth = FirebaseAuth.instance;
  final email = Get.arguments["email"];
  User? user;
  Timer? timer;
  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      timer!.cancel();
      Get.back();
    }
  }

  @override
  void initState() {
    user = auth.currentUser;
    user!.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "E-Mail verification",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: const [BoxShadow(blurRadius: 25)],
                      color: const Color.fromARGB(255, 161, 46, 46),
                      borderRadius: BorderRadius.circular(10)),
                  height: 250,
                  width: 360,
                  child: Column(
                    children: [
                     const  Text(
                        "The verification E-Mail has been",
                        style:  TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "sent to",
                          style:  TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          email,
                          style: const  TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 234, 234, 234)),
                          onPressed: () {
                            FirebaseAuth.instance.currentUser!.sendEmailVerification();
                          },
                          child: const Text(
                            "Resend",
                            style: TextStyle(
                                color: Color.fromARGB(255, 161, 46, 46)),
                          )),
                      const SizedBox(
                        height: 35,
                      ),
                      const Text(
                        'Check the entered E-Mail if the Mail hasn\'t received',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
