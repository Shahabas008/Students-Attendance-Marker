import 'package:collegeproject/create_an_account/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    waitingscreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 138, 40, 40),
        body: Stack(alignment: Alignment.center, children: [
          Container(
            color: const Color.fromARGB(255, 161, 46, 46),
            height: 350,
            width: 350,
          ),
          Align(
            child: Image.asset(
              "assets/AttendEase.jpeg",
              width: 300,
              height: 500,
            ),
          ),
        ]),
      ),
    );
  }

  void waitingscreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const Loginpage());
    });
  }
}
