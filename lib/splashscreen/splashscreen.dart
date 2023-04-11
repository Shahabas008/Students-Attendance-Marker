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
    return   SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 234, 234, 234),
         body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children:    [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children:const [
                 Text(
                   'Digital \nAttendance \nMarker',
                   style: TextStyle(
                     fontSize: 40,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 161, 46, 46),
                   ),
                 ),
               ],
             ),
           ],
         ),
      ),
    );
  }

  void waitingscreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const Loginpage());
    });
  }
}
